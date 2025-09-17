require "test_helper"

class TrainRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get train_routes_show_url
    assert_response :success
  end
end
