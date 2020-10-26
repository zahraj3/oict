require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get state of the app" do
    get api_state_url

    assert_response :success

    body = JSON.parse(response.body, symbolize_names: true)
    assert_equal body[:app_state], 'running'
  end

  test "card info should return 401 for unauthorized user" do
    get api_card_info_url

    assert_response 401 # (unauthorized)
  end

  test "card info should return information about a card" do
    params = {cln_or_id: 920310153687}
    auth_headers = {"Authorization" => "Basic #{Base64.encode64('oict:secret')}"}

    # I know I am calling the real endpoint... I should create a mock for it... :)
    get '/api/card_info', params: params, as: :json, headers: auth_headers

    assert_response :success

    body = JSON.parse(response.body, symbolize_names: true)
    assert_equal body[:state_description], 'Aktivní v držení klienta'
    assert_equal body[:validity_end], '12.08.2020'
  end

  test "card info should require correct parameter" do
    params = {wrong_param: 920310153687}
    auth_headers = {"Authorization" => "Basic #{Base64.encode64('oict:secret')}"}

    get '/api/card_info', params: params, as: :json, headers: auth_headers

    body = JSON.parse(response.body, symbolize_names: true)
    assert_equal body[:error_params], 'Please, check params.'
  end
end
