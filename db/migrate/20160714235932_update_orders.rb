class UpdateOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :stripe_order_id
    add_column :orders, :stripe_charge_id, :string
    add_column :orders, :stripe_customer_id, :string
    add_column :orders, :status, :integer
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :sticker_price, :integer
    add_column :orders, :sales_tax, :integer
    add_column :orders, :notes, :text
    add_column :orders, :shipping_address, :json
  end
end
