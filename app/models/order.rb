# frozen_string_literal: true
class Order < ApplicationRecord
  validates :email, :stripe_charge_id, :sticker_type, :sticker_quantity, presence: true
  enum sticker_type: { valor: 100, mystic: 200, instinct: 300 }
end
