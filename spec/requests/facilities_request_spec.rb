require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "Facilities", type: :request do
  before do
		allow_any_instance_of(GeocodingService).to receive(:coordinates).and_return([36.123456, 137.987654])

		stub_request(:get, /textsearch/).to_return(
			status: 200,
			body: {
				"results" => [
					{
						"place_id" => "abc123",
						"name" => "妙高スキー場",
						"geometry" => {
							"location" => {
								"lat" => 36.123456,
								"lng" => 137.987654
							}
						},
						"formatted_address" => "新潟県妙高市",
						"rating" => 4.2,
						"user_ratings_total" => 87
					}
				],
				"status" => "OK"
			}.to_json,
			headers: { 'Content-Type' => 'application/json' }
		)

		stub_request(:get, /nearbysearch/).to_return(
			status: 200,
			body: {
				"results" => [
					{
						"name" => "妙高レンタルショップ",
						"geometry" => {
							"location" => {
								"lat" => 36.123456,
								"lng" => 137.987654
							}
						},
						"vicinity" => "長野県白馬村"
					}
				],
				"status" => "OK"
			}.to_json,
			headers: { 'Content-Type' => 'application/json' }
		)
  end

  describe "GET /facilities" do
    it "施設情報が表示される" do
      get facilities_path, params: { name: "妙高" }

      expect(response).to have_http_status(:success)
      expect(response.body).to include("妙高レンタルショップ")
    end
  end
end
