# frozen_string_literal: true

class CardDetail
  prepend SimpleCommand

  def initialize(cln_or_id)
    @cln_or_id = cln_or_id
  end

  def call
    response_state = OictClient.call("#{@cln_or_id}/state")
    response_validity = OictClient.call("#{@cln_or_id}/validity")

    if response_state.success? && response_validity.success?
      response_state.result.merge(response_validity.result)
    else
      errors.add(:error_state, response_state.errors)
      errors.add(:error_validity, response_validity.errors)
    end
  end

end
