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

ActiveRecord::Schema.define(:version => 20120716192111) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "branchtests", :force => true do |t|
    t.string   "name"
    t.string   "branch"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.boolean  "recurring"
    t.datetime "recurring_ends"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "tags"
    t.string   "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "email"
    t.string   "location"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "groups", ["user_id", "created_at"], :name => "index_groups_on_user_id_and_created_at"

  create_table "invitations", :force => true do |t|
    t.string   "invited_members"
    t.datetime "sent_at"
    t.integer  "sender_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "member"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["user_id", "group_id"], :name => "index_memberships_on_user_id_and_group_id", :unique => true
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "participations", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "approval"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "attend"
  end

  create_table "pastevents", :force => true do |t|
    t.integer  "user_id"
    t.string   "orgname"
    t.string   "location"
    t.float    "hours"
    t.string   "adminname"
    t.string   "email"
    t.boolean  "approval"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "disclamer"
    t.string   "token"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "reflections", :force => true do |t|
    t.integer  "r_id"
    t.text     "u_reflection"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reflectors", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
