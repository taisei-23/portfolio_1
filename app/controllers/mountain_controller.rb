class MountainController < ApplicationController
  def index
    if params[:area].present?
      lat, lng = GeocodingService.new(params[:area]).coordinates
Rails.logger.debug "coords: #{lat}, #{lng}"

      if lat && lng
        places = GooglePlacesService.new(lat: lat, lng: lng, keyword: "スキー場").search
Rails.logger.debug "places: #{places.inspect}"
        @results = places['results']
        @lat = lat
        @lng = lng
      else
        @results = []
        flash.now[:alert] = "エリアが見つかりませんでした。"
      end
    else
      @results = []
    end
  end
end
