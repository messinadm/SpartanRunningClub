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

ActiveRecord::Schema.define(version: 20150120042723) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.integer  "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousel_items", force: true do |t|
    t.string   "primary_caption"
    t.string   "secondary_caption"
    t.integer  "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "commenter_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.time     "time"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "followings", force: true do |t|
    t.integer  "member_id"
    t.integer  "followable_id"
    t.string   "followable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "followings", ["followable_id", "followable_type"], name: "index_followings_on_followable_id_and_followable_type", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "members", force: true do |t|
    t.string   "email",                           null: false
    t.string   "encrypted_password",  limit: 128, null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "case_id",             limit: 6
    t.string   "year"
    t.boolean  "competitive"
    t.boolean  "officer"
    t.string   "position"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "request"
    t.string   "slug"
  end

  add_index "members", ["email"], name: "index_members_on_email", using: :btree
  add_index "members", ["remember_token"], name: "index_members_on_remember_token", using: :btree

  create_table "news", force: true do |t|
    t.string   "title",      null: false
    t.integer  "author_id",  null: false
    t.string   "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practices", force: true do |t|
    t.string   "day",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "time"
    t.string   "location"
  end

  create_table "routes", force: true do |t|
    t.string   "title"
    t.decimal  "distance",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_my_run_id"
  end

end
