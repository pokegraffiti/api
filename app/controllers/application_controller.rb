# frozen_string_literal: true
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::BadRequest, with: :bad_request
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def bad_request(error)
    notify_airbrake(error)
    render json: { error: error.message }, status: :bad_request
  end

  def record_not_found(error)
    notify_airbrake(error)
    render json: { error: error.message }, status: :not_found
  end
end
