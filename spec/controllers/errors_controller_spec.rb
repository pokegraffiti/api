# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  describe 'GET #bad_request' do
    it 'returns http bad_request' do
      get :bad_request
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET #not_found' do
    it 'returns http not_found' do
      get :not_found
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #internal_server_error' do
    it 'returns http internal_server_error' do
      get :internal_server_error
      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
