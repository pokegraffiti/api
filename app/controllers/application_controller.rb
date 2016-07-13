# frozen_string_literal: true
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::BadRequest, with: :bad_request
  rescue_from ActionController::ParameterMissing, with: :bad_request

  before_action do
    params.transform_keys!(&:underscore)
  end

  private

  def bad_request(error)
    # Airbrake.notify(error)
    render json: { error: error.message }, status: :bad_request
  end

  def record_not_found(error)
    # Airbrake.notify(error)
    render json: { error: error.message }, status: :not_found
  end
end
