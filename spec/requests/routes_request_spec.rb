require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "Routes", type: :request do
  describe "GET /routes/show" do
    context "from/toがある場合" do
			before do
				stub_request(:get, /maps.googleapis.com/)
				.to_return(status: 200, body: {
					status: "OK",
					routes: [
					{
						summary: "最短ルート",
						legs: [
						{
							distance: { text: "150 km" },
							duration: { text: "2時間30分" },
							start_address: "東京駅",
							end_address: "軽井沢駅"
						}
						]
					}
					]
				}.to_json, headers: { 'Content-Type' => 'application/json' })

				stub_request(:get, /router.hereapi.com/)
					.to_return(status: 200, body: {
						routes: [
							{
								sections: [
									{
										tolls: [
											{
												fares: [
													{ price: { value: 1500, currency: "JPY" } }
												]
											}
										]
									}
								]
							}
						]
					}.to_json, headers: { 'Content-Type' => 'application/json' })

				stub_request(:get, /geocode\.search\.hereapi\.com/)
					.to_return(
						status: 200,
						body: {
							items: [
								{ position: { lat: 35.681236, lng: 139.767125 } }
							]
						}.to_json,
						headers: { 'Content-Type' => 'application/json' }
					)

				end

      it "画面にルート情報が表示される" do
        get routes_show_path, params: {
          from: "東京駅",
          to: "軽井沢駅",
          transport: "car"
        }

        expect(response).to have_http_status(:ok)
				expect(response.body).to include("最短ルート")
				expect(response.body).to include("2時間30分")
				expect(response.body).to include("￥1,500")
      end
    end

    context "from/toが未指定の場合" do
      it "@route_dataがnilで何も表示されない" do
        get routes_show_path
        expect(response).to have_http_status(:ok)
        expect(response.body).not_to include("ルート")
      end
    end
  end
end
