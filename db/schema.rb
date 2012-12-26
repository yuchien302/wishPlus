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

ActiveRecord::Schema.define(:version => 20121226210102) do

  create_table "chats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
    t.string   "useruid"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "wish_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participations", ["story_id", "user_id"], :name => "index_participations_on_story_id_and_user_id", :unique => true
  add_index "participations", ["story_id"], :name => "index_participations_on_story_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "star_id"
    t.string   "star_uid"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "picture"
    t.datetime "oauth_expires_at"
    t.datetime "birthday"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "wishes", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "type"
    t.text     "description"
    t.string   "photo"
    t.string   "videoId"
    t.string   "pid"
  end

end
