# frozen_string_literal: true
FactoryGirl.define do
  factory :order do
    email            { Faker::Internet.email }
    stripe_charge_id { 'STRIPE_CHARGE_ID' }
    sticker_type     { :valor }
    sticker_quantity 5
  end
end
