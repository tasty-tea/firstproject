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

ActiveRecord::Schema.define(version: 2018_05_31_140458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currency_subscribes", force: :cascade do |t|
    t.string "currency_denominator"
    t.string "currency_numerator"
  end

  create_table "rates", force: :cascade do |t|
    t.float "rate"
    t.string "curr_1"
    t.string "curr_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates_users", id: false, force: :cascade do |t|
    t.bigint "rate_id", null: false
    t.bigint "user_id", null: false
    t.index ["rate_id"], name: "index_rates_users_on_rate_id"
    t.index ["user_id"], name: "index_rates_users_on_user_id"
  end

  create_table "usds", force: :cascade do |t|
    t.string "rate"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "suspended", default: false
    t.text "subscribes", default: [["USD", "RUR", "1"], ["EUR", "RUR", "1"], ["CNY", "RUR", "1"], ["JPY", "RUR", "1"]], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
