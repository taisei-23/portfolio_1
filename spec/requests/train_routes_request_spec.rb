require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "TrainRoutes", type: :request do
	describe "GET #sidebar" do
		context "from/toがある場合" do
			it "サイドバーのリンクが表示される" do
				get train_route_sidebar_path, params: { from: "東京駅", to: "新宿駅" }
				expect(response).to have_http_status(:success)
				expect(response.body).to include("Yahoo!路線情報")
			end
		end

		context "from/toがない場合" do
			it "サイドバーのリンクが表示されない" do
				get train_route_sidebar_path, params: { from: "", to: "" }
				expect(response).to have_http_status(:success)
				expect(response.body).not_to include("Yahoo!路線情報")
			end
		end
	end
end
