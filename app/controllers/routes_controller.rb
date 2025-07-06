require 'net/http'
require 'uri'
require 'json'

class RoutesController < ApplicationController
  def show
    @transport = params[:transport]
    @from = params[:from]
    @to = params[:to]
    @waypoints = params[:waypoints]

    if @from.present? && @to.present?
      @route_data = fetch_directions(@from, @to, @transport)
    else
      @route_data = nil
    end
  end

  def fetch_directions(from, to, transport)
  api_key = ENV["GOOGLE_MAPS_API_KEY"]
  mode = "driving"
  base_url = "https://maps.googleapis.com/maps/api/directions/json"

  uri = URI.parse("#{base_url}?origin=#{URI.encode_www_form_component(from)}&destination=#{URI.encode_www_form_component(to)}&mode=#{mode}&key=#{api_key}")

  response = Net::HTTP.get_response(uri)
  json = JSON.parse(response.body)

  Rails.logger.info "Directions API request URL: #{uri}"
  Rails.logger.info "Directions API response: #{json}"

  if json["status"] == "OK"
    leg = json["routes"][0]["legs"][0]
    {
      distance: leg["distance"]["text"],
      duration: leg["duration"]["text"],
      start_address: leg["start_address"],
      end_address: leg["end_address"],
      steps: leg["steps"].map { |step| step["html_instructions"] }
    }
  else
    Rails.logger.error("Directions API error: #{json['status']} - #{json['error_message']}")
    nil
  end
end
end
