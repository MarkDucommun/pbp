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

ActiveRecord::Schema.define(:version => 20130907161105) do

  create_table "donations", :force => true do |t|
    t.integer  "user_id",                                                      :null => false
    t.integer  "project_id",                                                   :null => false
    t.integer  "hours",                                       :default => 0
    t.decimal  "dollar_amount", :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "owner_id",                   :null => false
    t.string   "title",                      :null => false
    t.text     "description",                :null => false
    t.integer  "hour_goal",   :default => 0
    t.integer  "dollar_goal", :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.datetime "deadline",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "fb_uid"
    t.string   "fb_nickname"
    t.string   "fb_avatar_url"
    t.string   "fb_oauth"
    t.string   "fb_oauth_expires_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "balanced_customer_uri"
  end

end
