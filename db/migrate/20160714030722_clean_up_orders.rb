class CleanUpOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :stripe_charge_id
    remove_column :orders, :stripe_customer_id
  end
end
