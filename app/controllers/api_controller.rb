class ApiController < ApplicationController
  require 'rest-client'

  def state
    json_response({app_state: 'running'})
  end

  def card_info
    response_state = Oictclient.call("#{params[:cln_or_id]}/state")
    response_validity = Oictclient.call("#{params[:cln_or_id]}/validity")

    formated_response = format_response(response_state.result, response_validity.result)
    json_response(format_response)
  end

  private

  def format_response(state, validity)
    {
     state_description: state[:state_description],
     validity_end: formate_date(validity[:validity_end])
    }
  end

  def formate_date(date)
    date.to_datetime.strftime("%d.%m.%Y")
  end

  def card_info_params
    params.required(:cln_or_id)
  end
end
