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

ActiveRecord::Schema[7.2].define(version: 2024_12_03_135057) do
  create_table "donhangs", force: :cascade do |t|
    t.string "hoten"
    t.string "sdt"
    t.string "email"
    t.text "diachi"
    t.string "tensanpham"
    t.integer "soluong"
    t.string "trangthaithanhtoan"
    t.integer "tongthanhtoan"
    t.datetime "ngaydathang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "taikhoan_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipient_id", null: false
    t.boolean "read", default: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["taikhoan_id"], name: "index_messages_on_taikhoan_id"
  end

  create_table "sanphams", force: :cascade do |t|
    t.string "ten", null: false
    t.string "loai"
    t.text "mota"
    t.decimal "gia", precision: 10, scale: 2
    t.integer "soluong"
    t.string "hinhanh"
    t.string "donvi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taikhoans", force: :cascade do |t|
    t.string "username"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "hoten"
    t.date "ngaysinh"
    t.string "diachi"
    t.string "sdt"
    t.string "quyen"
    t.string "avatar_url"
    t.text "giohang"
  end

  add_foreign_key "messages", "taikhoans"
  add_foreign_key "messages", "taikhoans", column: "recipient_id"
end
