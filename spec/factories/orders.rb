# frozen_string_literal: true
FactoryGirl.define do
  factory :order do
    status              { :created }
    email               { Faker::Internet.email }
    stripe_customer_id  { 'STRIPE_CUSTOMER_ID' }
    shipping_address    { { name: 'FAKE_NAME', line1: 'FAKE_ADDRESS' } }
    sticker_type        { :valor }
    sticker_quantity    { 1 }
    sticker_price       { 500 }
    referral_code       { SecureRandom.urlsafe_base64 }
  end
end
