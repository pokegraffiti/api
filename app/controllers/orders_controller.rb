# frozen_string_literal: true
class OrdersController < ApplicationController
  # POST /orders.json
  def create
    @order = CreateOrder.call!(order_params)
    render json: { redirect_url: success_path }, status: :created
  rescue StandardError => error
    notify_airbrake(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")
    render json: { redirect_url: failure_path }, status: :unprocessable_entity
  end

  # GET /orders/stats
  def stats
    total_count   = Order.sum(:sticker_quantity).to_f
    team_instinct = [Order.team_instinct.sum(:sticker_quantity).to_f, 1.0].max / [total_count, 1.0].max
    team_mystic   = [Order.team_mystic.sum(:sticker_quantity).to_f,   1.0].max / [total_count, 1.0].max
    team_valor    = [Order.team_valor.sum(:sticker_quantity).to_f,    1.0].max / [total_count, 1.0].max
    render json: {
      instinct: team_instinct,
      mystic: team_mystic,
      valor: team_valor
    }, status: :ok
  end

  private

  def order_params
    params.require(:order).permit(
      :email, :sticker_type, :sticker_quantity, :stripe_token, :shipping_name,
      :shipping_address_line1, :shipping_address_line2, :shipping_address_city,
      :shipping_address_state, :shipping_address_country, :shipping_address_zip
    )
  end
end
