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

ActiveRecord::Schema.define(version: 2019_11_04_072320) do

  create_table "airplane_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.integer "cot", null: false
    t.integer "seat_amount", null: false
    t.integer "bin_amount", null: false
    t.decimal "bin_length", precision: 6, scale: 3, null: false
    t.decimal "bin_width", precision: 6, scale: 3, null: false
    t.decimal "bin_height", precision: 6, scale: 3, null: false
    t.decimal "assignable_space_percentage", precision: 6, scale: 3, null: false
    t.decimal "purchasable_space_percentage", precision: 6, scale: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_id"], name: "index_airplane_classes_on_airplane_id"
  end

  create_table "airplanes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
  end

  create_table "luggages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "length", precision: 6, scale: 3, null: false
    t.decimal "width", precision: 6, scale: 3, null: false
    t.decimal "height", precision: 6, scale: 3, null: false
    t.text "image_url", null: false
    t.integer "space_index", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_luggages_on_user_id"
  end

  create_table "purchase_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id"
    t.decimal "space_increasement", precision: 6, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_purchase_logs_on_store_id"
    t.index ["user_id"], name: "index_purchase_logs_on_user_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_stores_on_username", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "ticket_id", null: false
    t.integer "seat_index", null: false
    t.bigint "airplane_class_id", null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_class_id"], name: "index_users_on_airplane_class_id"
    t.index ["flight_id"], name: "index_users_on_flight_id"
    t.index ["ticket_id"], name: "index_users_on_ticket_id", unique: true
  end

  add_foreign_key "airplane_classes", "airplanes"
  add_foreign_key "flights", "airplanes"
  add_foreign_key "luggages", "users"
  add_foreign_key "purchase_logs", "stores"
  add_foreign_key "purchase_logs", "users"
  add_foreign_key "users", "airplane_classes"
  add_foreign_key "users", "flights"
end
