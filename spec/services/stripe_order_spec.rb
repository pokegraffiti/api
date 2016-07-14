# frozen_string_literal: true
require 'rails_helper'

RSpec.describe StripeOrder, type: :service do
  describe '.authorize' do
    let(:stripe_token) do
      Stripe::Token.create(
        card: { number: '4242424242424242', exp_month: 7, exp_year: 2017, cvc: '314' }
      )
    end
    let(:order) { build(:order, stripe_order_id: nil) }
    let(:stripe_params) do
      { token: stripe_token.id, shipping_address: {
        name: 'Frank',
        line1: '45 Plumb Branch Road New Lenox, IL 60451'
      } }
    end

    it 'creates a charge' do
      expect(described_class.authorize(order, stripe_params)).to be_a Stripe::Order
    end
  end
end
