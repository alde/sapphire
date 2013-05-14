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

ActiveRecord::Schema.define(version: 20130420182225) do

  create_table "adjustments", id: false, force: true do |t|
    t.integer "id",              null: false
    t.integer "character_id",    null: false
    t.text    "comment",         null: false
    t.text    "date",            null: false
    t.float   "shares",          null: false
    t.float   "original_shares", null: false
  end

  add_index "adjustments", ["id"], name: "id", using: :btree

  create_table "character_classes", force: true do |t|
    t.text "name", null: false
  end

  create_table "character_rewards", force: true do |t|
    t.integer "reward_id",    null: false
    t.integer "character_id", null: false
  end

  create_table "characters", force: true do |t|
    t.text     "name",                                            null: false
    t.integer  "character_class_id",                              null: false
    t.boolean  "active",                                          null: false
    t.integer  "user_id"
    t.text     "rank",                                            null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  create_table "default_prices", force: true do |t|
    t.text  "slot",         null: false
    t.float "price_normal", null: false
    t.float "price_heroic", null: false
  end

  create_table "items", force: true do |t|
    t.text    "name",         null: false
    t.integer "wowid_normal", null: false
    t.integer "wowid_heroic", null: false
    t.float   "price_normal", null: false
    t.float   "price_heroic", null: false
    t.text    "slot",         null: false
    t.text    "item_type",    null: false
    t.integer "ilvl",         null: false
    t.text    "quality",      null: false
  end

  create_table "log", force: true do |t|
    t.text "date",     null: false
    t.text "username", null: false
    t.text "message",  null: false
    t.text "type",     null: false
  end

  create_table "loots", force: true do |t|
    t.integer "item_id",                      null: false
    t.integer "raid_id",                      null: false
    t.integer "character_id",                 null: false
    t.float   "price",                        null: false
    t.boolean "heroic",       default: false, null: false
    t.boolean "offspec",      default: false, null: false
  end

  create_table "multiplier", force: true do |t|
    t.integer "ilvl",       null: false
    t.float   "multiplier", null: false
  end

  create_table "raids", force: true do |t|
    t.integer "zone_id", null: false
    t.text    "date",    null: false
    t.text    "comment", null: false
  end

  create_table "rewards", force: true do |t|
    t.float   "number_of_shares", null: false
    t.float   "original_shares",  null: false
    t.text    "comment",          null: false
    t.integer "raid_id",          null: false
    t.integer "mob_id"
    t.integer "loot_id"
  end

  create_table "users", force: true do |t|
    t.integer  "rank",                                            null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zones", force: true do |t|
    t.text "name", null: false
  end

end
