# frozen_string_literal: true
require 'stripe'

PER_STICKER_PRICE = 100

class StripeCharge
  def self.authorize(order, stripe_params)
    customer = Stripe::Customer.create(email: order.email, source: stripe_params[:token])
    Stripe::Charge.create(
      amount: PER_STICKER_PRICE * order.sticker_quantity,
      currency: 'usd',
      capture: false,
      description: "#{order.sticker_quantity} Team #{order.sticker_type.titleize} Die Cut Sticker",
      metadata: {
        email: order.email,
        sticker_quantity: order.sticker_quantity,
        sticker_type: order.sticker_type
      },
      receipt_email: order.email,
      shipping: stripe_params[:shipping_address],
      customer: customer.id,
      statement_descriptor: "Team #{order.sticker_type.titleize} Stickers"
    )
  end
end
