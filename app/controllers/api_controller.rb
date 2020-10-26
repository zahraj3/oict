class ApiController < ApplicationController
  def state
    json_response({app_state: 'running'})
  end
end
