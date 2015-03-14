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

ActiveRecord::Schema.define(version: 20150314090429) do

  create_table "conditions", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "conditions_people", id: false, force: :cascade do |t|
    t.integer "condition_id", null: false
    t.integer "person_id",    null: false
  end

  create_table "crafts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "condition_id", default: 0, null: false
    t.integer  "patient_id"
    t.integer  "team_id"
    t.integer  "measure_id"
    t.integer  "active"
    t.integer  "parent"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.text     "description"
    t.string   "units"
    t.decimal  "value",        precision: 8, scale: 2
    t.integer  "operator"
    t.integer  "places",                               default: 0, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "measurevalues", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "measure_id"
    t.decimal  "value",      precision: 8, scale: 2
    t.date     "value_date"
    t.integer  "created_by"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "address_line"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "state"
    t.string   "postcode"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "family_name"
    t.string   "given_names"
    t.string   "known_as"
    t.string   "address_line"
    t.string   "address_line_2"
    t.string   "town"
    t.string   "state"
    t.string   "postcode"
    t.integer  "sex"
    t.date     "dob"
    t.string   "ihi"
    t.string   "dva"
    t.string   "phone"
    t.integer  "created_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "family_name"
    t.string   "given_names"
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.integer  "craft_id"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "goal_id",     default: 0, null: false
    t.integer  "person_id"
    t.integer  "team"
    t.integer  "active",      default: 1
    t.integer  "parent",      default: 0
    t.integer  "task_type",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provider_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
