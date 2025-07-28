class MountainController < ApplicationController
  def search
    if params[:area].present?
      lat, lng = GeocodingService.new(params[:area]).coordinates

      if lat && lng
        places = GooglePlacesService.new(lat: lat, lng: lng, keyword: "スキー場").search

        @results = []

        places["results"].each do |place|
          next unless place["place_id"] && place["geometry"] && place["geometry"]["location"]

          mountain = Mountain.find_or_initialize_by(place_id: place["place_id"])
          unless mountain.update(
            name: place["name"],
            latitude: place["geometry"]["location"]["lat"],
            longitude: place["geometry"]["location"]["lng"],
            address: place["vicinity"],
            rating: place["rating"],
            user_ratings_total: place["user_ratings_total"]
          )
            Rails.logger.debug "保存失敗: #{mountain.errors.full_messages}"
          end

          @results << mountain
        end

        @lat = lat
        @lng = lng
        @search_completed = true
      else
        @results = []
        flash.now[:alert] = "エリアが見つかりませんでした"
        @search_completed = false
      end
    else
      @results = []
      @search_completed = false
    end
  end
end
