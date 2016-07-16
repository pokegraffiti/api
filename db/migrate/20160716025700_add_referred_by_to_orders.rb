class AddReferredByToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :referred_by, :string
  end
end
