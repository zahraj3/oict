require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get state" do
    get api_state_url
    assert_response :success
  end

end
