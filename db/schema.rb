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

ActiveRecord::Schema.define(version: 20150329001239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.string  "email"
    t.boolean "pre_auth",   default: false
    t.integer "event_id"
    t.integer "contact_id"
    t.string  "charge_id"
  end

  add_index "attendees", ["contact_id"], name: "index_attendees_on_contact_id", using: :btree
  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string  "number"
    t.integer "cvv"
    t.string  "expiry"
    t.string  "fullname"
    t.integer "user_id"
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string  "email"
    t.string  "firstname"
    t.string  "lastname"
    t.string  "phone"
    t.integer "user_id"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "cost"
    t.boolean  "closed",   default: false
    t.datetime "start"
    t.datetime "end"
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_key"
  end

end
