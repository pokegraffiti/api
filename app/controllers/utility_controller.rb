# frozen_string_literal: true
class UtilityController < ApplicationController
  def stats
    render json: {
      instinct: Order.team_instinct.count,
      mystic: Order.team_mystic.count,
      valor: Order.team_valor.count
    }, status: :ok
  end
end
