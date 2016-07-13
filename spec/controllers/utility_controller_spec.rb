# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UtilityController, type: :controller do
  describe 'GET #stats' do
    it 'returns http success' do
      get :stats
      expect(response).to have_http_status(:success)
    end
  end
end
