require "test_helper"

class AirportsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get add_path
    assert_response :success
  end

end
