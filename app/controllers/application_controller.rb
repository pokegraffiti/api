# frozen_string_literal: true
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::BadRequest, with: :bad_request
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def bad_request(error)
    notify_airbrake(error)

    respond_to do |format|
      format.html { render 'errors/bad_request', status: :bad_request }
      format.json { render json: { error: error.message }, status: :bad_request }
    end
  end

  def record_not_found(error)
    notify_airbrake(error)

    respond_to do |format|
      format.html { render 'errors/not_found', status: :not_found }
      format.json { render json: { error: error.message }, status: :not_found }
    end
  end
end
