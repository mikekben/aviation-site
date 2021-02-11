require "test_helper"




class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "My Testing Project"
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get info" do
    get static_pages_info_url
    assert_response :success
    assert_select "title", "Info | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
