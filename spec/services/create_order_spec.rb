# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CreateOrder, type: :service do
  describe '.call!' do
    let(:stripe_token) do
      Stripe::Token.create(
        card: { number: '4242424242424242', exp_month: 7, exp_year: 2017, cvc: '314' }
      )
    end
    let(:order_params) do
      ActionController::Parameters.new(
        email: 'TEST@EXAMPLE.COM',
        sticker_type: 'valor',
        sticker_quantity: 1,
        stripe_token: stripe_token.id,
        shipping_name: 'Frank',
        shipping_address_line1: '45 Plumb Branch Road New Lenox, IL 60451'
      )
    end

    it 'creates an order' do
      order = described_class.call!(order_params)
      expect(order).to be_a(Order)
      expect(order).to be_persisted
    end
  end
end
