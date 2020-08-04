require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tours_show_url
    assert_response :success
  end

end
