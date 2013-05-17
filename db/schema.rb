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

ActiveRecord::Schema.define(:version => 20130516123038) do

  create_table "admin_users", :force => true do |t|
    t.string   "username",        :limit => 25
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",                         :default => "email address", :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  add_index "admin_users", ["first_name"], :name => "index_admin_users_on_first_name"
  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "vehicles", :force => true do |t|
    t.string   "make",                :limit => 25
    t.string   "model",               :limit => 25
    t.string   "terms"
    t.string   "sub_model"
    t.text     "vehicle_description"
    t.text     "deal_description"
    t.integer  "weekly_price"
    t.integer  "monthly_price"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "vehicles", ["make"], :name => "index_vehicles_on_make"
  add_index "vehicles", ["model"], :name => "index_vehicles_on_model"

end
