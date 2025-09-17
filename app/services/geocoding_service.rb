require "httparty"

class GeocodingService
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/geocode"

  def initialize(address)
    @address = address
    @api_key = ENV["GOOGLE_MAPS_API_KEY"]
  end

  def coordinates
    response = self.class.get("/json", query: {
      address: @address,
      key: @api_key,
      language: "ja"
    })

    if response.success? && response["results"].any?
      location = response["results"][0]["geometry"]["location"]
      [ location["lat"], location["lng"] ]
    else
      [ nil, nil ]
    end
  end
end
