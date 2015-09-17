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

ActiveRecord::Schema.define(version: 20150915029000) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apartments", force: true do |t|
    t.string   "number"
    t.integer  "floor"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.string   "name"
    t.integer  "condo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "floor_qty"
  end

  create_table "buildings_communications", id: false, force: true do |t|
    t.integer "building_id"
    t.integer "communication_id"
  end

  add_index "buildings_communications", ["building_id"], name: "index_buildings_communications_on_building_id"
  add_index "buildings_communications", ["communication_id"], name: "index_buildings_communications_on_communication_id"

  create_table "communications", force: true do |t|
    t.date     "begin_date"
    t.date     "expiration_date"
    t.string   "message"
    t.string   "subject"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "communications", ["begin_date"], name: "index_communications_on_begin_date"
  add_index "communications", ["expiration_date"], name: "index_communications_on_expiration_date"

  create_table "condos", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "website"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_accounts", force: true do |t|
    t.integer  "facebook_id"
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "content"
    t.integer  "person_id"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "apartment_id"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.date     "birthdate"
    t.string   "phone_area_code"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "condo_id"
    t.boolean  "admin",           default: false
    t.integer  "apartment_id"
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "vivento_accounts", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
