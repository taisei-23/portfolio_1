class MountainController < ApplicationController
  def index
    if params[:area].present?
      lat, lng = GeocodingService.new(params[:area]).coordinates

      if lat && lng
        places = GooglePlacesService.new(lat: lat, lng: lng, keyword: "スキー場").search
        @results = places['results']
        @lat = lat
        @lng = lng
        @search_completed = true
      else
        @results = []
        flash.now[:alert] = "エリアが見つかりませんでした。"
        @search_completed = false
      end
    else
      @results = []
      @search_completed = false
    end
  end
end
