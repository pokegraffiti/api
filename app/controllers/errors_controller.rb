# frozen_string_literal: true
class ErrorsController < ApplicationController
  # GET /400
  def bad_request
    render(status: :bad_request)
  end

  # GET /404
  def not_found
    render(status: :not_found)
  end

  # GET /500
  def internal_server_error
    render(status: :internal_server_error)
  end
end
