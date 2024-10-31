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

ActiveRecord::Schema[7.1].define(version: 2024_10_30_113100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id", null: false
    t.index ["restaurant_id"], name: "index_bookings_on_restaurant_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "review"
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "site"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.date "date_d_arrivee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_guests_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "restaurant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "jour"
    t.time "heure"
    t.integer "number_of_guests"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "rest_name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_statuses_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "nom"
    t.date "date_de_demande"
    t.string "nom_du_client"
    t.text "description"
    t.date "date_d_echeance"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guest_id"
    t.index ["guest_id"], name: "index_tasks_on_guest_id"
  end

  create_table "taxi_bookings", force: :cascade do |t|
    t.date "pickup_date"
    t.string "pickup_place"
    t.string "dropoff_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "restaurants"
  add_foreign_key "comments", "tasks"
  add_foreign_key "guests", "hotels"
  add_foreign_key "statuses", "tasks"
  add_foreign_key "tasks", "guests"
end
