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

ActiveRecord::Schema.define(version: 20161031065422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name",           default: "Main Office", null: false
    t.string   "street_address", default: "",            null: false
    t.string   "sub_district",   default: "",            null: false
    t.string   "district",       default: "",            null: false
    t.string   "province",       default: "",            null: false
    t.string   "country",        default: "",            null: false
    t.string   "postal_code",    default: "",            null: false
    t.integer  "job_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["job_id"], name: "index_addresses_on_job_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.float    "amount",     null: false
    t.datetime "expiration", null: false
    t.integer  "job_id"
    t.integer  "haulier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["haulier_id"], name: "index_bids_on_haulier_id", using: :btree
    t.index ["job_id"], name: "index_bids_on_job_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "salutation",             default: "",    null: false
    t.string   "nickname",               default: ""
    t.string   "email",                  default: "",    null: false
    t.boolean  "admin",                  default: false
    t.integer  "phone",                                  null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "company_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "hauliers", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "company_name",           default: "",         null: false
    t.string   "street_address",         default: "",         null: false
    t.string   "sub_district",           default: ""
    t.string   "district",               default: ""
    t.string   "province",               default: "",         null: false
    t.string   "country",                default: "Thailand", null: false
    t.string   "postal_code",            default: "",         null: false
    t.integer  "office_phone",                                null: false
    t.string   "contact_person",         default: "",         null: false
    t.integer  "tax_id",                                      null: false
    t.boolean  "admin",                  default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["email"], name: "index_hauliers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_hauliers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "job_pictures", force: :cascade do |t|
    t.string   "pickup_file_name"
    t.string   "pickup_content_type"
    t.integer  "pickup_file_size"
    t.datetime "pickup_updated_at"
    t.string   "dropoff_file_name"
    t.string   "dropoff_content_type"
    t.integer  "dropoff_file_size"
    t.datetime "dropoff_updated_at"
    t.integer  "employee_id"
    t.integer  "job_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["employee_id"], name: "index_job_pictures_on_employee_id", using: :btree
    t.index ["job_id"], name: "index_job_pictures_on_job_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "description",     default: "",    null: false
    t.text     "details",         default: "",    null: false
    t.datetime "pickup_date",                     null: false
    t.datetime "delivery_date",                   null: false
    t.string   "special_details", default: ""
    t.datetime "time_delivered"
    t.boolean  "delivered?",      default: false
    t.integer  "haulier_id"
    t.integer  "shipper_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["shipper_id"], name: "index_jobs_on_shipper_id", using: :btree
  end

  create_table "shippers", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "company_name",           default: "",         null: false
    t.string   "street_address",         default: "",         null: false
    t.string   "sub_district",           default: ""
    t.string   "district",               default: ""
    t.string   "province",               default: "",         null: false
    t.string   "country",                default: "Thailand", null: false
    t.string   "postal_code",            default: "",         null: false
    t.integer  "office_phone",           default: 0,          null: false
    t.string   "contact_person",         default: "",         null: false
    t.integer  "tax_id",                 default: 0
    t.boolean  "admin",                  default: true
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["email"], name: "index_shippers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_shippers_on_reset_password_token", unique: true, using: :btree
  end

end
