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

ActiveRecord::Schema.define(version: 20151030074559) do

  create_table "client_types", force: :cascade do |t|
    t.string   "name_en"
    t.string   "name_ar"
    t.string   "prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "client_type_id"
    t.string   "name_en"
    t.string   "name_ar"
    t.float    "registration_number"
    t.date     "client_date"
    t.string   "national_number"
    t.string   "income_tax_number"
    t.string   "sales_tax_number"
    t.string   "prefix"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "files_primary_type_id"
    t.integer  "files_secondary_type_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "filers", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "files_secondary_type_id"
    t.string   "name_en"
    t.string   "name_ar"
    t.string   "notes"
    t.date     "transaction_date"
    t.string   "file_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "files_primary_types", force: :cascade do |t|
    t.string   "name_en"
    t.string   "name_ar"
    t.boolean  "yearly"
    t.string   "prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "files_secondary_types", force: :cascade do |t|
    t.integer  "files_primary_type_id"
    t.string   "name_en"
    t.string   "name_ar"
    t.string   "year"
    t.string   "prefix"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "papers", force: :cascade do |t|
    t.integer  "filer_id"
    t.string   "order"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "url_file_name"
    t.string   "url_content_type"
    t.integer  "url_file_size"
    t.datetime "url_updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
