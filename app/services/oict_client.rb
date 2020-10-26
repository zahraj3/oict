# frozen_string_literal: true

class OictClient
  prepend SimpleCommand

  LITACKA_URL = 'http://rivate-264465-litackaapi.apiary-mock.com/cards/'.freeze
  X_API_KEY = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQ2h5dHJ5IE9kcG92aWRhYyIsInJvbGVzIjpbInVzZXIiXSwiaWF0IjoxNTExNDUwNTk3fQ.p-MUGvUsUeQwsfRJSCdTm8eAP_MnyRrM58q6ehUjGLiDu5Bjkm7Gvbs0JTDitzPvWejkfrw-4fMXKjHKfj6gBQ'.freeze

  def initialize(request)
    @request = request
  end

  def call
    response = send_request

    JSON.parse(response.body, symbolize_names: true)
  rescue RestClient::ExceptionWithResponse => e
    add_response_error(e.http_code, e.message)
    e.response
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
      :x_api_key => X_API_KEY
    }
  end

  def add_response_error(type, error_collection)
    error_response = { type: type, collection: Array.wrap(error_collection) }
    errors.add(:response, error_response)
  end
end
