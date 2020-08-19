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

ActiveRecord::Schema.define(version: 2020_08_16_072318) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "departure_date"
    t.integer "airplane_grade"
    t.integer "hotel_grade"
    t.text "remarks_column"
    t.bigint "user_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "未対応"
    t.index ["tour_id"], name: "index_bookings_on_tour_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "considerations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_considerations_on_tour_id"
    t.index ["user_id", "tour_id"], name: "index_considerations_on_user_id_and_tour_id", unique: true
    t.index ["user_id"], name: "index_considerations_on_user_id"
  end

  create_table "tours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tour_name"
    t.string "image"
    t.string "number_of_night"
    t.string "length_of_stay"
    t.string "departure"
    t.string "arrival"
    t.string "city"
    t.integer "base_price"
    t.integer "airplane_b_price"
    t.integer "airplane_c_price"
    t.integer "airplane_d_price"
    t.integer "hotel_b_price"
    t.integer "hotel_c_price"
    t.integer "hotel_d_price"
    t.text "recommend_point"
    t.text "schedule"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "tours"
  add_foreign_key "bookings", "users"
  add_foreign_key "considerations", "tours"
  add_foreign_key "considerations", "users"
  add_foreign_key "tours", "users"
end
