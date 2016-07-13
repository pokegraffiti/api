# frozen_string_literal: true
class OrdersController < ApplicationController
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    charge = StripeCharge.authorize(@order, stripe_params)
    @order.stripe_charge_id = charge.id

    if @order.save
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:email, :sticker_type, :sticker_quantity)
  end

  def stripe_params
    params.require(:order).permit(:token, :shipping_address)
  end
end
