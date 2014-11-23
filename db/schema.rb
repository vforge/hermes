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

ActiveRecord::Schema.define(version: 20141116174002) do

  create_table "ad_campaigns", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.datetime "starting_at"
    t.datetime "ending_at"
    t.string   "target"
    t.string   "status"
    t.boolean  "visible",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_campaigns", ["visible", "company"], name: "ac_c"
  add_index "ad_campaigns", ["visible", "status", "starting_at", "ending_at"], name: "ac_sse"
  add_index "ad_campaigns", ["visible", "status"], name: "ac_s"
  add_index "ad_campaigns", ["visible"], name: "ac_v"

  create_table "ad_sizes", force: true do |t|
    t.string   "name"
    t.string   "classification"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", force: true do |t|
    t.string   "filename"
    t.integer  "ad_campaign_id"
    t.text     "href"
    t.string   "status"
    t.integer  "ad_size_id"
    t.boolean  "visible",        default: true
    t.integer  "count_requests", default: 0
    t.integer  "count_clicks",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads", ["visible", "status", "ad_campaign_id"], name: "ad_sa"
  add_index "ads", ["visible", "status", "ad_size_id"], name: "ad_sa2"
  add_index "ads", ["visible", "status"], name: "ad_s"
  add_index "ads", ["visible"], name: "ad_v"

  create_table "target_params", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "possible_values"
    t.string   "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_params", ["category"], name: "tp_c"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "locale"
    t.boolean  "visible",         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["visible", "email", "password_digest"], name: "us_ep"
  add_index "users", ["visible", "role"], name: "us_r"
  add_index "users", ["visible"], name: "us_v"

end
