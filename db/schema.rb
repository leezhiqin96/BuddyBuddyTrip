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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_093215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", null: false
    t.index ["itinerary_id"], name: "index_collaborations_on_itinerary_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "countries", primary_key: "country_code", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "country_code"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name", null: false
    t.string "expense_type", null: false
    t.integer "amount", null: false
    t.datetime "expense_date"
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_expenses_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "total_budget"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_countries", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country_code"
    t.index ["itinerary_id"], name: "index_itinerary_countries_on_itinerary_id"
  end

  create_table "itinerary_destinations", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_itinerary_destinations_on_destination_id"
    t.index ["itinerary_id"], name: "index_itinerary_destinations_on_itinerary_id"
  end

  create_table "storage_date_destinations", force: :cascade do |t|
    t.bigint "storage_date_id", null: false
    t.bigint "destination_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_storage_date_destinations_on_destination_id"
    t.index ["storage_date_id"], name: "index_storage_date_destinations_on_storage_date_id"
  end

  create_table "storage_dates", force: :cascade do |t|
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "itinerary_id", null: false
    t.index ["itinerary_id"], name: "index_storage_dates_on_itinerary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collaborations", "itineraries"
  add_foreign_key "collaborations", "users"
  add_foreign_key "destinations", "countries", column: "country_code", primary_key: "country_code"
  add_foreign_key "expenses", "itineraries"
  add_foreign_key "itineraries", "users", column: "owner_id"
  add_foreign_key "itinerary_countries", "countries", column: "country_code", primary_key: "country_code"
  add_foreign_key "itinerary_countries", "itineraries"
  add_foreign_key "itinerary_destinations", "destinations"
  add_foreign_key "itinerary_destinations", "itineraries"
  add_foreign_key "storage_date_destinations", "destinations"
  add_foreign_key "storage_date_destinations", "storage_dates"
  add_foreign_key "storage_dates", "itineraries"
end
