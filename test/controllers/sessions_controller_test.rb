require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get status" do
    get sessions_status_url
    assert_response :success
  end

end
