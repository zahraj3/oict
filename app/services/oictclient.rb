# frozen_string_literal: true

class Oictclient
  prepend SimpleCommand
  LITACKA_URL = "http://private-264465-litackaapi.apiary-mock.com/cards/".freeze

  def initialize(request)
    @request = request
  end

  def call
    response = send_request

    JSON.parse(response.body, symbolize_names: true)
  end

  private


  def send_request
    RestClient.get target_url, headers
  end

  def target_url
    "#{LITACKA_URL}#{@request}"
  end

  def headers
    {
      :content_type => 'application/json; charset=utf-8',
      :x_api_key => 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQ2h5dHJ5IE9kcG92aWRhYyIsInJvbGVzIjpbInVzZXIiXSwiaWF0IjoxNTExNDUwNTk3fQ.p-MUGvUsUeQwsfRJSCdTm8eAP_MnyRrM58q6ehUjGLiDu5Bjkm7Gvbs0JTDitzPvWejkfrw-4fMXKjHKfj6gBQ'
    }
  end
end
