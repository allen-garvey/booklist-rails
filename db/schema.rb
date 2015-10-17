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

ActiveRecord::Schema.define(version: 20151017020250) do

  create_table "authors", force: :cascade do |t|
    t.string   "last"
    t.string   "first"
    t.string   "middle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "author_id"
    t.date     "date_added"
    t.integer  "pre_rating"
    t.integer  "classification_id"
    t.integer  "genre_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"
  add_index "books", ["classification_id"], name: "index_books_on_classification_id"
  add_index "books", ["genre_id"], name: "index_books_on_genre_id"

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_books", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_books", ["book_id"], name: "index_list_books_on_book_id"
  add_index "list_books", ["list_id"], name: "index_list_books_on_list_id"

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["library_id"], name: "index_locations_on_library_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "post_rating"
    t.integer  "book_id"
    t.date     "date_added"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id"

end
