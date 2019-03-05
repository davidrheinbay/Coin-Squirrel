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

ActiveRecord::Schema.define(version: 2019_03_05_155717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_rates", force: :cascade do |t|
    t.string "currency_origin_short"
    t.string "currency_target_short"
    t.float "rate"
    t.datetime "date_created"
    t.datetime "date_updated"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_exchange_rates_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "currency_name"
    t.string "currency_short"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "company_entity_name"
    t.float "commission_perc"
    t.float "user_commission_perc"
    t.string "referral_link"
    t.string "logo_image"
    t.string "card_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "transaction_type"
    t.integer "gmv_eur"
    t.float "commission_perc"
    t.float "user_commission_share_perc"
    t.float "user_commission_amount"
    t.float "eur_currency_rate"
    t.string "link_used"
    t.bigint "partner_id"
    t.bigint "game_id"
    t.datetime "transaction_confirmed_date"
    t.datetime "transaction_completed_date"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_transactions_on_game_id"
    t.index ["partner_id"], name: "index_transactions_on_partner_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image", default: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1551801247/765-default-avatar.png"
    t.string "first_name"
    t.string "last_name"
    t.bigint "game_id"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "EUR", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["game_id"], name: "index_users_on_game_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exchange_rates", "games"
  add_foreign_key "transactions", "games"
  add_foreign_key "transactions", "partners"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "games"
end
