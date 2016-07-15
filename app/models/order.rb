# frozen_string_literal: true
class Order < ApplicationRecord
  validates :status, :email, :stripe_customer_id, :shipping_address,
            :sticker_type, :sticker_quantity, :sticker_price, presence: true

  enum sticker_type: [:valor, :mystic, :instinct]
  enum status: [:created, :authorized, :paid, :canceled, :fulfilled, :returned]

  scope :team_instinct, -> { where(sticker_type: :instinct) }
  scope :team_mystic,   -> { where(sticker_type: :mystic) }
  scope :team_valor,    -> { where(sticker_type: :valor) }
end
