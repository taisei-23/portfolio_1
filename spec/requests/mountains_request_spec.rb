require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "Mountains", type: :request do
  before do
    allow_any_instance_of(GeocodingService).to receive(:coordinates).and_return([ 35.681236, 139.767125 ])
    allow_any_instance_of(GooglePlacesService).to receive(:search).and_return({
      "results" => [
        {
          "place_id" => "ChIJLz1y5x9uGGAR5x9uGGAR",
          "name" => "スキー場",
          "geometry" => {
            "location" => {
              "lat" => 35.681236,
              "lng" => 139.767125
            }
          },
          "vicinity" => "東京都千代田区",
          "rating" => 4.5,
          "user_ratings_total" => 100
        }
      ]
    })
  end

  describe "GET /mountain" do
    context "エリアが指定されている場合" do
      it "スキー場の情報が表示される" do
        get mountain_path, params: { area: "東京都千代田区" }

        expect(response).to have_http_status(:success)
        expect(response.body).to include("スキー場")
        expect(response.body).to include("東京都千代田区")
      end
    end

    context "エリアが指定されていない場合" do
      it "スキー場の情報は表示されない" do
        get mountain_path

        expect(response).to have_http_status(:success)
        expect(response.body).not_to include("スキー場")
        expect(response.body).not_to include("東京都千代田区")
      end
    end
  end
end
