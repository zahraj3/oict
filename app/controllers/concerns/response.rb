# frozen_string_literal: true

# Response for API controller
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def jbuilder_response(object, status = :ok)
    render object, status: status
  end

  def yaml_response(object, status = :ok)
    render plain: object.to_yaml(line_width: -1), status: status
  end
end
