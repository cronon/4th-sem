# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141130102931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "clubs", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "address"
    t.string  "photo"
    t.string  "city"
    t.string  "web_site"
    t.string  "metro"
    t.string  "email"
    t.integer "owner_id"
    t.integer "category_id"
  end

  add_index "clubs", ["category_id"], name: "index_clubs_on_category_id", using: :btree
  add_index "clubs", ["owner_id"], name: "index_clubs_on_owner_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.integer  "user_id"
    t.integer  "club_id"
  end

  add_index "comments", ["club_id"], name: "index_comments_on_club_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.integer  "club_id"
  end

  add_index "news", ["club_id"], name: "index_news_on_club_id", using: :btree

  create_table "orders", force: true do |t|
    t.time    "time"
    t.string  "confirmation"
    t.text    "comment"
    t.integer "user_id"
    t.integer "table_id"
  end

  add_index "orders", ["table_id"], name: "index_orders_on_table_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "rates", force: true do |t|
    t.integer "stars"
    t.integer "club_id"
    t.integer "rating_type_id"
    t.integer "user_id"
  end

  add_index "rates", ["club_id"], name: "index_rates_on_club_id", using: :btree
  add_index "rates", ["rating_type_id"], name: "index_rates_on_rating_type_id", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "rating_types", force: true do |t|
    t.string "name"
  end

  create_table "subscribes", force: true do |t|
    t.integer "club_id"
    t.integer "user_id"
  end

  add_index "subscribes", ["club_id"], name: "index_subscribes_on_club_id", using: :btree
  add_index "subscribes", ["user_id"], name: "index_subscribes_on_user_id", using: :btree

  create_table "tables", force: true do |t|
    t.integer "seats"
    t.integer "club_id"
  end

  add_index "tables", ["club_id"], name: "index_tables_on_club_id", using: :btree

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
