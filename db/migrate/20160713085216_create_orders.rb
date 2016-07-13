class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :stripe_charge_id
      t.integer :sticker_type
      t.integer :sticker_quantity

      t.timestamps
    end
  end
end
