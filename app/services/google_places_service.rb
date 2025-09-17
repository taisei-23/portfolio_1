require "httparty"

class GooglePlacesService
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/place/nearbysearch"

  def initialize(lat:, lng:, keyword:)
    @lat = lat
    @lng = lng
    @keyword = keyword
    @api_key = ENV["GOOGLE_MAPS_API_KEY"]
  end

  def search
    response = self.class.get("/json", query: {
      location: "#{@lat},#{@lng}",
      radius: 50000,
      keyword: @keyword,
      language: "ja",
      key: @api_key
    })

    response.parsed_response
  end
end
