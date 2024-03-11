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

ActiveRecord::Schema[7.1].define(version: 2024_03_11_151637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabeches", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.integer "price_per_minute"
    t.string "description"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_cabeches_on_users_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.boolean "status"
    t.date "date"
    t.time "time"
    t.integer "total_amount"
    t.bigint "cabeches_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabeches_id"], name: "index_reservations_on_cabeches_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cabeches", "users", column: "users_id"
  add_foreign_key "reservations", "cabeches", column: "cabeches_id"
  add_foreign_key "reservations", "users", column: "users_id"
end
