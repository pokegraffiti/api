# frozen_string_literal: true
require 'stripe'

class StripeOrder
  def self.sticker_type_to_sku(sticker_type)
    raise unless sticker_type
    stripe_product = Stripe::Product.list.find { |product| product.id == sticker_type }
    stripe_product.skus.first.id
  end

  def self.authorize(order, stripe_params)
    stripe_customer = Stripe::Customer.create(email: order.email, source: stripe_params[:token])
    Stripe::Order.create(
      currency: 'usd',
      customer: stripe_customer,
      items: [
        {
          type: 'sku',
          parent: sticker_type_to_sku(order.sticker_type),
          quantity: order.sticker_quantity
        }
      ],
      shipping: {
        name: stripe_params.dig(:shipping_address, :name),
        address: {
          line1: stripe_params.dig(:shipping_address, :line1),
          line2: stripe_params.dig(:shipping_address, :line2),
          city: stripe_params.dig(:shipping_address, :city),
          state: stripe_params.dig(:shipping_address, :state),
          country: stripe_params.dig(:shipping_address, :country),
          postal_code: stripe_params.dig(:shipping_address, :postal_code)
        }
      }
    )
  end
end
