# frozen_string_literal: true
FactoryGirl.define do
  factory :order do
    email            { Faker::Internet.email }
    stripe_order_id  { 'STRIPE_ORDER_ID' }
    sticker_type     { :valor }
    sticker_quantity 5
  end
end
