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

ActiveRecord::Schema.define(version: 20160920222451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.decimal  "donation_amount", precision: 8, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "nonprofit_programs", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.integer  "zipcode",     limit: 8
    t.string   "photo"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "donation_goal",           precision: 10, scale: 2
    t.decimal  "total_donated",           precision: 10, scale: 2
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "address"
    t.integer  "zipcode",       limit: 8
    t.integer  "visits"
    t.string   "photo"
  end

  create_table "resident_programs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.boolean  "volunteer",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "support_status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "resident",        default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
