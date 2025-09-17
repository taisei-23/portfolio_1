require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get routes_show_url
    assert_response :success
  end
end
