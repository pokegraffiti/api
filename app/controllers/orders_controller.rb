# frozen_string_literal: true
class OrdersController < ApplicationController
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.stripe_order_id = StripeOrder.authorize(@order, stripe_params).id

    if @order.save
      head :created
    else
      head :unprocessable_entity
    end
  end

  # GET /orders/stats
  def stats
    total_count   = Order.sum(:sticker_quantity).to_f
    team_instinct = [Order.team_instinct.sum(:sticker_quantity).to_f, 1.0].max / [total_count, 1.0]
    team_mystic   = [Order.team_mystic.sum(:sticker_quantity).to_f,   1.0].max / [total_count, 1.0]
    team_valor    = [Order.team_valor.sum(:sticker_quantity).to_f,    1.0].max / [total_count, 1.0]
    render json: {
      instinct: team_instinct,
      mystic: team_mystic,
      valor: team_valor
    }, status: :ok
  end

  private

  def order_params
    params.require(:order).permit(:email, :sticker_type, :sticker_quantity)
  end

  def stripe_params
    params.require(:order).permit(:token, :shipping_address)
  end
end
