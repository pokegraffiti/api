# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def show
      raise ActiveRecord::RecordNotFound
    end

    def update
      raise ActionController::BadRequest
    end
  end

  describe 'handling RecordNotFound exceptions' do
    it 'returns the not_found error' do
      routes.draw { get 'show' => 'anonymous#show' }
      get :show
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'handling BadRequest exceptions' do
    it 'returns the bad_request error' do
      routes.draw { get 'update' => 'anonymous#update' }
      get :update
      expect(response).to have_http_status(:bad_request)
    end
  end
end
