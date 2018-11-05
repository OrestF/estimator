class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user! # TODO: remove later

  rescue_from Sequel::NoMatchingRow, with: :not_found_response

  protected

  def not_found_response(e)
    render_error("Record not found: #{e.message}")
  end

  def render_error(error)
    render json: { error: error }
  end
end
