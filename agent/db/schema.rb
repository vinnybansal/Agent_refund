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

ActiveRecord::Schema.define(:version => 20110328132204) do

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email",                                   :null => false
    t.string   "crypted_password",                        :null => false
    t.string   "password_salt",                           :null => false
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "broker_name"
    t.text     "office_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "persistence_token",                       :null => false
    t.string   "perishable_token",                        :null => false
    t.integer  "login_count",          :default => 0,     :null => false
    t.integer  "failded_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "license_file_name"
    t.string   "license_content_type"
    t.integer  "license_file_size"
    t.datetime "license_updated_at"
    t.string   "policy_file_name"
    t.string   "policy_content_type"
    t.integer  "policy_file_size"
    t.datetime "policy_updated_at"
    t.boolean  "p_completed",          :default => false
    t.boolean  "ag_uploaded",          :default => false
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "field4"
    t.string   "user_type"
    t.string   "property_type"
    t.string   "price"
    t.boolean  "active",               :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
