require 'test_helper'

class ConsiderationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get considerations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get considerations_destroy_url
    assert_response :success
  end

end
