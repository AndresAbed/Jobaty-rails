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

ActiveRecord::Schema.define(version: 20151222210309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "web"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "other_web"
    t.string   "profile_img_file_name"
    t.string   "profile_img_content_type"
    t.integer  "profile_img_file_size"
    t.datetime "profile_img_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "companies", ["confirmation_token"], name: "index_companies_on_confirmation_token", unique: true, using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.string   "institution"
    t.date     "since"
    t.date     "until"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "phone"
    t.string   "gender"
    t.integer  "salary"
    t.string   "remote"
    t.string   "job_type"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "web"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "profile_img_file_name"
    t.string   "profile_img_content_type"
    t.integer  "profile_img_file_size"
    t.datetime "profile_img_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "employees", ["confirmation_token"], name: "index_employees_on_confirmation_token", unique: true, using: :btree
  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree

  create_table "interested_jobs", force: :cascade do |t|
    t.string   "job"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_experiences", force: :cascade do |t|
    t.string   "title"
    t.string   "company"
    t.date     "since"
    t.date     "until"
    t.string   "description"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
