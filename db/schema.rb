# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160716030834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "orders", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email"
    t.integer  "sticker_type"
    t.integer  "sticker_quantity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "stripe_charge_id"
    t.string   "stripe_customer_id"
    t.integer  "status"
    t.integer  "shipping_cost"
    t.integer  "sticker_price"
    t.integer  "sales_tax"
    t.text     "notes"
    t.json     "shipping_address"
    t.string   "referrer_code"
    t.string   "referral_code"
    t.index ["referral_code"], name: "index_orders_on_referral_code", unique: true, using: :btree
  end

end
