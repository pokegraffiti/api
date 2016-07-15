# frozen_string_literal: true
require 'stripe'

class CreateOrder
  def self.call!(params)
    validate!(params)
    Order.create!(
      status: :created,

      # Customer Details
      email:              params[:email],
      stripe_customer_id: create_stripe_customer(params).id,
      shipping_address:   parse_shipping_address(params),

      # Order Details
      sticker_type:     params[:sticker_type],
      sticker_quantity: params[:sticker_quantity],
      sticker_price:    sticker_price(params[:sticker_quantity])
    )
  end

  def self.validate!(params)
    raise 'Parameter email is missing'                  unless params[:email]
    raise 'Parameter sticker_type is missing'           unless params[:sticker_type]
    raise 'Parameter sticker_quantity is missing'       unless params[:sticker_quantity]
    raise 'Parameter stripe_token is missing'           unless params[:stripe_token]
    raise 'Parameter shipping_name is missing'          unless params[:shipping_name]
    raise 'Parameter shipping_address_line1 is missing' unless params[:shipping_address_line1]
  end

  def self.create_stripe_customer(params)
    Stripe::Customer.create(
      email: params[:email],
      source: params[:token],
      shipping: {
        name: params[:shipping_name],
        address: parse_shipping_address(params).except(:name)
      }
    )
  end

  def self.parse_shipping_address(params)
    {
      name:        params[:shipping_name],
      line1:       params[:shipping_address_line1],
      line2:       params[:shipping_address_line2],
      city:        params[:shipping_address_city],
      state:       params[:shipping_address_state],
      country:     params[:shipping_address_country],
      postal_code: params[:shipping_address_zip]
    }
  end

  def self.sticker_price(sticker_quantity)
    case sticker_quantity
    when 1
      550 # 1.10 per sticker, 5 per sku
    when 2
      525 # 1.05 per sticker, 5 per sku
    when 4
      500 # 1.00 per sticker, 5 per sku
    else
      raise "#{sticker_quantity} was out of range"
    end
  end
end
