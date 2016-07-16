class AddReferralCodeToOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :referred_by, :referrer_code
    add_column :orders, :referral_code, :string
    add_index :orders, :referral_code, unique: true
  end
end
