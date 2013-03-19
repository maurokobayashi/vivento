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

ActiveRecord::Schema.define(:version => 20130319015417) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

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

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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

  create_table "communications", :force => true do |t|
    t.string   "subject"
    t.string   "message"
    t.date     "begin_date"
    t.date     "expiration_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "condos", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "website"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facebook_accounts", :force => true do |t|
    t.integer "facebook_id",  :limit => 8
    t.string  "access_token"
    t.integer "user_id",                   :null => false
  end

  add_index "facebook_accounts", ["facebook_id"], :name => "index_facebook_accounts_on_facebook_id"
  add_index "facebook_accounts", ["user_id"], :name => "index_facebook_accounts_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "content"
    t.integer  "person_id"
    t.datetime "sent_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "email",        :null => false
    t.string   "picture"
    t.integer  "apartment_id"
    t.integer  "user_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "condo_id",                          :null => false
    t.boolean  "admin",          :default => false
    t.string   "remember_token"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "users", ["condo_id"], :name => "index_users_on_condo_id"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "vivento_accounts", :force => true do |t|
    t.string  "email",           :null => false
    t.string  "password_digest", :null => false
    t.integer "user_id",         :null => false
  end

  add_index "vivento_accounts", ["email"], :name => "index_vivento_accounts_on_email"
  add_index "vivento_accounts", ["user_id"], :name => "index_vivento_accounts_on_user_id"

end
