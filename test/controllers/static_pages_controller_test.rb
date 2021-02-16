require "test_helper"


class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Aviation Site"
  end


  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get info" do
    get info_path
    assert_response :success
    assert_select "title", "Info | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get distance" do
    get distance_path
    assert_response :success
    assert_select "title", "Distance Calculator | #{@base_title}"
  end

end
