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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121230004715) do

  create_table "addresses", :force => true do |t|
    t.integer  "condo_id"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "apartments", :force => true do |t|
    t.string   "number"
    t.integer  "floor"
    t.integer  "building_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.integer  "condo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "floor_qty"
  end

  create_table "condos",          :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "website"
    t.integer  "address_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages",        :force => true do |t|
    t.string   "content"
    t.integer  "person_id"
    t.datetime "sent_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "people",          :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users",           :force => true do |t|
    t.integer  "apartment_id"
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.date     "birthdate"
    t.string   "phone_area_code"
    t.string   "phone_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "condo_id"
    t.integer  "apartment_id"
    t.integer  "facebook_id",     :limit => 8
    t.boolean  "admin",           :default => false
    t.string   "picture"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
