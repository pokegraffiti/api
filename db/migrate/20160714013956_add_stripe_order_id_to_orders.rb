class AddStripeOrderIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stripe_order_id, :string
  end
end
