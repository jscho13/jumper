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

ActiveRecord::Schema.define(version: 20160112153315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",                    null: false
    t.text     "review_body"
    t.integer  "user_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id",                  null: false
    t.integer  "revup_count",   default: 0, null: false
    t.integer  "revdown_count", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username",                                  null: false
    t.string   "avatar"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name",  null: false
    t.string   "street_name", null: false
    t.string   "state",       null: false
    t.string   "zip_code",    null: false
    t.string   "city",        null: false
    t.text     "description"
    t.integer  "price_range"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id",     null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "review_id",                  null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "up",         default: false, null: false
  end

  add_index "votes", ["review_id", "user_id"], name: "index_votes_on_review_id_and_user_id", unique: true, using: :btree

end
