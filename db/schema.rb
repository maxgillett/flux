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

ActiveRecord::Schema.define(version: 20141228233905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "authors"
    t.string   "publication_name"
    t.text     "keywords"
    t.text     "url"
    t.text     "description"
    t.string   "publication_date"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read_status"
    t.integer  "journal_id"
  end

  add_index "articles", ["journal_id"], name: "index_articles_on_journal_id", using: :btree
  add_index "articles", ["url"], name: "index_articles_on_url", unique: true, using: :btree

  create_table "journals", force: true do |t|
    t.string   "name"
    t.string   "current_issue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

end
