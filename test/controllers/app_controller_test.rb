require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get app_top_url
    assert_response :success
  end

end
