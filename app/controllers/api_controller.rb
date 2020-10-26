class ApiController < ApplicationController
  require 'rest-client'

  http_basic_authenticate_with name: "oict", password: "secret", except: :state

  def state
    json_response({app_state: 'running'})
  end

  def card_info
    unless card_info_params.empty?
      card_detail = CardDetail.call(card_info_params[:cln_or_id])

      if card_detail.success?
        formated_response = format_response(card_detail.result)
        json_response(formated_response)
      else
        json_response(card_detail.errors)
      end
    else
      json_response({error_params: 'Please, check params.'})
    end
  end

  private

  def format_response(card_detail)
    {
     state_description: card_detail[:state_description],
     validity_end: formate_date(card_detail[:validity_end])
    }
  end

  def formate_date(date)
    date.to_datetime.strftime("%d.%m.%Y")
  end

  def card_info_params
    card_info_params = params.permit(:cln_or_id)

    card_info_params
  end

end
