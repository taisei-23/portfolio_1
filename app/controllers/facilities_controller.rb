class FacilitiesController < ApplicationController
  def search
    @mountain = Mountain.find_by("name LIKE ?", "%#{params[:name]}%")

    if @mountain.nil?
      uri = URI("https://maps.googleapis.com/maps/api/place/textsearch/json")
      uri.query = URI.encode_www_form({
        query: "#{params[:name]} スキー場",
        key: ENV["GOOGLE_MAPS_API_KEY"],
        language: "ja"
      })

      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      if data["status"] == "OK" && data["results"].present?
        place = data["results"].first

        @mountain = Mountain.find_or_initialize_by(place_id: place["place_id"])
        unless @mountain.update(
          name: place["name"],
          latitude: place["geometry"]["location"]["lat"],
          longitude: place["geometry"]["location"]["lng"],
          address: place["formatted_address"],
          rating: place["rating"],
          user_ratings_total: place["user_ratings_total"]
        )
          Rails.logger.debug "山の保存失敗: #{@mountain.errors.full_messages}"
        end
        Rails.logger.debug "APIから新規山を登録または更新: #{@mountain.inspect}"
      else
        flash[:alert] = "該当する雪山が見つかりませんでした"
        return render :search
      end
    end

    lat = @mountain.latitude
    lng = @mountain.longitude
    keyword = params[:keyword].presence || "レンタルショップ"

    uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json")
    uri.query = URI.encode_www_form({
      key: ENV["GOOGLE_MAPS_API_KEY"],
      location: "#{lat},#{lng}",
      radius: 1500,
      keyword: keyword,
      language: "ja"
    })

    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    @places = data["results"]
  end
end
