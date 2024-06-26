# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_24_035500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "api_endpoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funding_rates", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.decimal "rate"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instrument_id", null: false
    t.index ["exchange_id"], name: "index_funding_rates_on_exchange_id"
    t.index ["instrument_id"], name: "index_funding_rates_on_instrument_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "funding_rates", "exchanges"
  add_foreign_key "funding_rates", "instruments"
end
