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

ActiveRecord::Schema.define(version: 20160522024912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loans", force: :cascade do |t|
    t.integer  "Zip"
    t.string   "Address1"
    t.string   "City"
    t.string   "State"
    t.string   "RequestedAmount"
    t.string   "ApplicationIP"
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "Email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "CampaignID"
    t.string   "CampaignCode"
    t.string   "Sub1"
    t.string   "LeadID"
    t.integer  "SSN"
    t.string   "EmployerName"
    t.integer  "RoutingNumber"
    t.integer  "AccountNumber"
    t.date     "DOB"
    t.date     "PayDay1"
    t.date     "PayDay2"
    t.string   "WorkPhone"
    t.integer  "PayFrequency"
    t.integer  "IncomeType"
    t.integer  "AccountType"
    t.boolean  "DirectDeposit"
    t.boolean  "IsMilitary"
    t.string   "UserID"
    t.string   "Password"
    t.string   "ApplicationURL"
    t.string   "HomePhone"
    t.integer  "MonthlyIncome"
    t.string   "status"
  end

end
