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

ActiveRecord::Schema.define(version: 20140930133935) do

  create_table "account_roles", force: true do |t|
    t.integer  "account_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_roles", ["account_id"], name: "index_account_roles_on_account_id", using: :btree
  add_index "account_roles", ["role_id"], name: "index_account_roles_on_role_id", using: :btree

  create_table "accounts", force: true do |t|
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
    t.string   "password_salt"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "appointments", force: true do |t|
    t.integer  "client_id"
    t.integer  "employee_id"
    t.string   "title"
    t.string   "description"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",      default: "inactive"
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["employee_id"], name: "index_appointments_on_employee_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_loyalty_point_invoices", force: true do |t|
    t.integer  "client_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_loyalty_point_invoices", ["client_id"], name: "index_client_loyalty_point_invoices_on_client_id", using: :btree
  add_index "client_loyalty_point_invoices", ["invoice_id"], name: "index_client_loyalty_point_invoices_on_invoice_id", using: :btree

  create_table "client_loyalty_points", force: true do |t|
    t.integer  "client_id"
    t.integer  "point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_loyalty_points", ["client_id"], name: "index_client_loyalty_points_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "birth_date"
    t.string   "occupation"
    t.string   "address"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communications", force: true do |t|
    t.integer  "client_id"
    t.string   "field"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  add_index "communications", ["client_id"], name: "index_communications_on_client_id", using: :btree
  add_index "communications", ["employee_id"], name: "index_communications_on_employee_id", using: :btree

  create_table "employee_attendants", force: true do |t|
    t.integer  "employee_id"
    t.datetime "checkin_time"
    t.string   "checkin_status"
    t.datetime "checkout_time"
    t.string   "checkout_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_attendants", ["employee_id"], name: "index_employee_attendants_on_employee_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "birthdate"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_code"
    t.string   "address"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "employment_status",   default: true
  end

  add_index "employees", ["position_id"], name: "index_employees_on_position_id", using: :btree

  create_table "invoice_details", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "employee_id"
    t.integer  "service_item_id"
    t.decimal  "new_price",       precision: 10, scale: 0
    t.string   "discount_type"
    t.decimal  "discount_value",  precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_details", ["employee_id"], name: "index_invoice_details_on_employee_id", using: :btree
  add_index "invoice_details", ["invoice_id"], name: "index_invoice_details_on_invoice_id", using: :btree
  add_index "invoice_details", ["service_item_id"], name: "index_invoice_details_on_service_item_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "client_id"
    t.decimal  "deposit",        precision: 10, scale: 0
    t.string   "payment_method"
    t.decimal  "discount",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                                  default: "unpaid"
    t.string   "invoice_code",                            default: "BSI000000"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "membership_scoring_conditions", force: true do |t|
    t.integer  "first_operand"
    t.string   "operator"
    t.integer  "second_operand"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "positions", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_packages", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires", force: true do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_item_packages", force: true do |t|
    t.string   "item_package"
    t.decimal  "price",        precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_items", force: true do |t|
    t.integer  "category_id"
    t.string   "item"
    t.decimal  "price",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_items", ["category_id"], name: "index_service_items_on_category_id", using: :btree

  create_table "services", force: true do |t|
    t.integer  "category_id"
    t.string   "item"
    t.decimal  "price",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree

  create_table "surveys", force: true do |t|
    t.integer  "client_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["client_id"], name: "index_surveys_on_client_id", using: :btree
  add_index "surveys", ["questionnaire_id"], name: "index_surveys_on_questionnaire_id", using: :btree

end
