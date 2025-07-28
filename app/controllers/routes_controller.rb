require "net/http"
require "uri"
require "json"

class RoutesController < ApplicationController
  def show
    @transport = params[:transport]
    @from = params[:from]
    @to = params[:to]
    @waypoints = Array(params[:waypoints]).reject(&:blank?)
    @show_sidebar = true


    if @from.present? && @to.present?
      directions = fetch_directions(@from, @to, @transport)
      tolls = fetch_toll_data(from: @from, to: @to, waypoints: @waypoints)

      @route_data = (directions || []).each_with_index.map do |route, index|
        toll_info = tolls[index] || { toll: 0, currency: "JPY" }
        route.merge(toll_info)
      end
    else
      @route_data = nil
    end
    Rails.logger.info "🚗 from: #{@from}, to: #{@to}, waypoints: #{@waypoints.inspect}"
  end

  def fetch_directions(from, to, transport)
    api_key = ENV["GOOGLE_MAPS_API_KEY"]
    mode = "driving"
    base_url = "https://maps.googleapis.com/maps/api/directions/json"

    uri = URI.parse("#{base_url}?origin=#{URI.encode_www_form_component(from)}&destination=#{URI.encode_www_form_component(to)}&mode=#{mode}&alternatives=true&key=#{api_key}")

    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)

    Rails.logger.info "Directions API request URL: #{uri}"
    Rails.logger.info "Directions API response: #{json}"

    if json["status"] == "OK"
      json["routes"].map do |route|
        leg = route["legs"][0]
        {
          summary: route["summary"],
          distance: leg["distance"]["text"],
          duration: leg["duration"]["text"],
          start_address: leg["start_address"],
          end_address: leg["end_address"]
        }
      end
    else
      Rails.logger.error("Directions API error: #{json['status']} - #{json['error_message']}")
      nil
    end
  end

  def fetch_toll_data(from:, to:, waypoints: [])
    base_url = "https://router.hereapi.com/v8/routes"
    api_key = ENV["HERE_API_KEY"]

    origin = geocode(from)
    destination = geocode(to)

    Rails.logger.info "🛰️ Requesting toll data with origin=#{origin}, destination=#{destination}"

    params = {
      origin: origin,
      destination: destination,
      transportMode: "car",
      return: "summary,tolls",
      alternatives: 3,
      apiKey: api_key
    }

    if waypoints.any?
      params[:via] = waypoints.map { |wp| geocode(wp) }
    end

    uri = URI(base_url)
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)

    if data["routes"]
      data["routes"].map do |route|
        section = route["sections"]&.first
        next { toll: 0, currency: "JPY" } unless section

        total_toll = 0
        currency = "JPY"

        if section["tolls"]
          section["tolls"].each do |toll_info|
            toll_info["fares"]&.each do |fare|
              price = fare["price"]
              total_toll += price["value"].to_f
              currency = price["currency"] if price["currency"]
            end
          end
        end

        {
          toll: total_toll,
          currency: currency
        }
      end
    else
      Rails.logger.warn "❌ Toll data missing. Geocoded origin: #{origin}, destination: #{destination}"
      Rails.logger.info "HERE API tolls response: #{data.to_json}"
      []
    end
  end

  private

  def geocode(location)
    api_key = ENV["HERE_API_KEY"]
    Rails.logger.info "🌐 Geocoding for location: #{location}"
    base_url = "https://geocode.search.hereapi.com/v1/geocode"
    uri = URI("#{base_url}?q=#{URI.encode_www_form_component(location)}&apiKey=#{api_key}")

    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)

    Rails.logger.info "📨 Geocode API URL: #{uri}"
    Rails.logger.info "📩 Geocode response: #{data}"

    if data["items"] && data["items"].any?
      pos = data["items"].first["position"]
      "#{pos['lat']},#{pos['lng']}"
    else
      Rails.logger.warn "❌ Geocoding failed for: #{location}"
      nil
    end
  end
end
