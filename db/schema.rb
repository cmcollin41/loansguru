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

ActiveRecord::Schema.define(version: 20160517044952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loan_applications", force: :cascade do |t|
    t.integer  "zip_code",       null: false
    t.string   "street_address", null: false
    t.string   "city",           null: false
    t.string   "state",          null: false
    t.string   "amount",         null: false
    t.string   "application_ip", null: false
    t.string   "home_phone",     null: false
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.string   "email_address",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "campaign_id"
    t.string   "campaign_code"
    t.string   "sub_1"
    t.string   "lead_id"
    t.string   "work_phone"
    t.string   "ssn"
    t.string   "employer_name"
    t.string   "routing_number"
    t.string   "account_number"
    t.date     "date_of_birth"
    t.date     "payday_1"
    t.date     "payday_2"
    t.integer  "pay_frequency"
    t.integer  "income_type"
    t.integer  "account_type"
    t.boolean  "direct_deposit"
    t.boolean  "is_military"
  end

end
