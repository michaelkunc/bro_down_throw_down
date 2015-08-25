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

ActiveRecord::Schema.define(version: 20150825001323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "challenger_id"
    t.integer  "challenged_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "relationships", ["challenged_id"], name: "index_relationships_on_challenged_id", using: :btree
  add_index "relationships", ["challenger_id", "challenged_id"], name: "index_relationships_on_challenger_id_and_challenged_id", unique: true, using: :btree
  add_index "relationships", ["challenger_id"], name: "index_relationships_on_challenger_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "style_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "image_url"
    t.text     "bio"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
  end

end
