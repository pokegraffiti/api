# frozen_string_literal: true
class Order < ApplicationRecord
  validates :email, :stripe_order_id, :sticker_type, :sticker_quantity, presence: true
  enum sticker_type: { valor: 100, mystic: 200, instinct: 300 }

  scope :team_instinct, -> { where(sticker_type: :instinct) }
  scope :team_mystic,   -> { where(sticker_type: :mystic) }
  scope :team_valor,    -> { where(sticker_type: :valor) }
end

# Token => Pending Charge => Order
