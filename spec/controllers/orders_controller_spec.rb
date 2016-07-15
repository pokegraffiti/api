# frozen_string_literal: true
require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:valid_attributes) do
    {
      email: Faker::Internet.email,
      sticker_type: 'valor',
      sticker_quantity: 1,
      token: 'STRIPE_TOKEN'
    }
  end

  let(:invalid_attributes) { {} }

  describe 'POST #create' do
    before(:each) do
      allow(CreateOrder).to receive(:call!).and_return(create(:order))
    end

    context 'with valid params' do
      it 'assigns a newly created order as @order' do
        post :create, params: { order: valid_attributes }
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it 'returns status code created' do
        post :create, params: { order: valid_attributes }
        expect(response).to have_http_status(:created)
      end

      it 'translates type from string to enum' do
        post :create, params: { order: valid_attributes }
        expect(assigns(:order).valor?).to be true
      end
    end

    context 'with invalid params' do
      it 'returns status code unprocessable_entity' do
        post :create, params: { order: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #stats' do
    it 'returns http success' do
      get :stats
      expect(response).to have_http_status(:success)
    end
  end
end
