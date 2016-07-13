# frozen_string_literal: true
require 'rails_helper'

RSpec.describe StripeCharge, type: :service do
  describe '.authorize' do
    let(:stripe_token) do
      Stripe::Token.create(
        card: {
          number: '4242424242424242',
          exp_month: 7,
          exp_year: 2017,
          cvc: '314'
        }
      )
    end
    let(:order) { build(:order, stripe_charge_id: nil) }
    let(:stripe_params) { { token: stripe_token.id, shipping_address: {} } }

    it 'creates a charge' do
      expect(StripeCharge.authorize(order, stripe_params)).to be_a Stripe::Charge
    end
  end
end
