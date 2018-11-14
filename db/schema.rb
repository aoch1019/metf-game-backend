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

ActiveRecord::Schema.define(version: 2018_11_14_220809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "etfs", force: :cascade do |t|
    t.float "score"
    t.bigint "user_id"
    t.bigint "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_etfs_on_pool_id"
    t.index ["user_id"], name: "index_etfs_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.float "init_price"
    t.bigint "stock_id"
    t.bigint "etf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["etf_id"], name: "index_picks_on_etf_id"
    t.index ["stock_id"], name: "index_picks_on_stock_id"
  end

  create_table "pools", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "etfs", "pools"
  add_foreign_key "etfs", "users"
  add_foreign_key "picks", "etfs"
  add_foreign_key "picks", "stocks"
end
