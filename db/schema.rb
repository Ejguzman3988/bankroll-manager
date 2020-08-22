# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_22_052514) do

  create_table "cash_games", force: :cascade do |t|
    t.string "name"
    t.string "stake"
    t.integer "max_players"
    t.decimal "buy_in", precision: 8, scale: 2
    t.integer "poker_site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "poker_site_id", null: false
    t.string "name"
    t.decimal "won", precision: 8, scale: 2
    t.bigint "game_type_id"
    t.string "game_type_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_type_type", "game_type_id"], name: "index_games_on_game_type_type_and_game_type_id"
    t.index ["poker_site_id"], name: "index_games_on_poker_site_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "poker_sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "late_reg"
    t.string "status"
    t.decimal "buy_in", precision: 8, scale: 2
    t.integer "poker_site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.decimal "bankroll", precision: 8, scale: 2, default: "0.0"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

  add_foreign_key "games", "poker_sites"
  add_foreign_key "games", "users"
end
