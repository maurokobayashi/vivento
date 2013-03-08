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

ActiveRecord::Schema.define(:version => 20130302223919) do

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

  create_table "elevator_walls", :force => true do |t|
    t.string   "subject"
    t.string   "communication"
    t.date     "creation_date"
    t.time     "creation_time"
    t.date     "expiration_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "content"
    t.integer  "person_id"
    t.datetime "sent_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "people",          :force => true do |t|
    t.string   "name",            :null => false
    t.string   "email",           :null => false
    t.string   "cpf"
    t.date     "birthdate"
    t.string   "phone_area_code"
    t.string   "phone_number"
    t.string   "gender",          :limit => 1
    t.string   "picture"
    t.integer  "apartment_id"
    t.integer  "user_id",         :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users",           :force => true do |t|
    t.integer  "condo_id",        :null => false
    t.boolean  "admin",           :default => false
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "vivento_accounts",  :force => true do |t|
    t.string   "email",             :null => false
    t.string   "password_digest",   :null => false
    t.integer  "user_id",           :null => false
  end

  create_table "facebook_accounts", :force => true do |t|
    t.integer  "facebook_id",       :limit => 8
    t.integer  "user_id",           :null => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["condo_id"], :name => "index_users_on_condo_id"
  add_index "vivento_accounts", ["email"], :name => "index_vivento_accounts_on_email"
  add_index "vivento_accounts", ["user_id"], :name => "index_vivento_accounts_on_user_id"
  add_index "facebook_accounts", ["facebook_id"], :name => "index_facebook_accounts_on_facebook_id"
  add_index "facebook_accounts", ["user_id"], :name => "index_facebook_accounts_on_user_id"
  add_index "people", ["user_id"], :name => "index_people_on_user_id"

end
