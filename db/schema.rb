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

ActiveRecord::Schema.define(version: 20160715162513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "type"
    t.string   "model"
    t.text     "description"
    t.date     "purchase_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cost"
    t.string   "serial"
    t.string   "equipment_type"
    t.string   "model_number"
    t.integer  "user_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "transaction_type"
    t.date     "assigned_on"
    t.date     "removed_on"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "transactions", ["item_id"], name: "index_transactions_on_item_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "users"
end
