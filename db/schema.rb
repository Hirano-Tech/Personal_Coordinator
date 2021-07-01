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

ActiveRecord::Schema.define(version: 0) do

  create_table "gu_staffs", id: { type: :integer, limit: 2, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "height", limit: 1, null: false, unsigned: true
    t.string "staff_id", null: false
    t.integer "store_id", limit: 2, null: false, unsigned: true
    t.index ["staff_id"], name: "staff_id", unique: true
    t.index ["store_id"], name: "store_id"
  end

  create_table "gu_stores", id: { type: :integer, limit: 2, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "prefecture_id", limit: 1, null: false, unsigned: true
    t.string "address", null: false
    t.string "phone", null: false
    t.index ["prefecture_id"], name: "prefecture_id"
  end

  create_table "prefectures", id: { type: :integer, limit: 1, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "gu_staffs", "gu_stores", column: "store_id", name: "gu_staffs_ibfk_1"
  add_foreign_key "gu_stores", "prefectures", name: "gu_stores_ibfk_1"
end
