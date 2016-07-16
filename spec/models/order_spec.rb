# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  describe '#referrer' do
    context 'when empty' do
      it 'returns nil' do
        expect(order.referrer).to eq nil
      end
    end

    context 'when referrer_code found' do
      let!(:referrering_order) { create(:order) }
      let(:order) { create(:order, referrer_code: referrering_order.referral_code) }

      it 'returns the referrering order' do
        expect(order.referrer).to eq referrering_order
      end
    end

    context 'when external referrer' do
      it 'returns nil' do
        expect(order.referrer).to eq nil
      end
    end
  end

  describe '#referrals' do
    context 'when empty' do
      it 'returns nil' do
        expect(order.referrals).to be_empty
      end
    end

    context 'when found' do
      let!(:referrered_order_a) { create(:order, referrer_code: order.referral_code) }
      let!(:referrered_order_b) { create(:order, referrer_code: order.referral_code) }

      it 'returns the referred orders' do
        expect(order.referrals).to eq [referrered_order_a, referrered_order_b]
      end
    end
  end
end
