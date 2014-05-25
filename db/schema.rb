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

ActiveRecord::Schema.define(version: 20140525203300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sales_infos", force: true do |t|
    t.string   "book_title"
    t.string   "url"
    t.string   "purchase_id"
    t.string   "total_paid_for_bundle"
    t.string   "book_revenue_from_bundle"
    t.decimal  "total_paid_for_book",                precision: 8, scale: 2
    t.decimal  "total_book_royalty",                 precision: 8, scale: 2
    t.string   "author_name"
    t.string   "author_percentage_of_total_royalty"
    t.string   "affiliate_code"
    t.string   "affiliate_cut"
    t.decimal  "author_and_cause_royalties",         precision: 8, scale: 2
    t.string   "cause_name"
    t.string   "cause_percentage_of_author_royalty"
    t.string   "cause_royalties_portion"
    t.decimal  "author_royalties_portion",           precision: 8, scale: 2
    t.string   "package_name"
    t.string   "bundle_name"
    t.date     "date_purchased"
    t.date     "royalty_held_until_at_least"
    t.string   "date_author_royalty_was_paid"
    t.string   "date_publisher_royalty_was_paid"
    t.string   "date_cause_royalty_was_paid"
    t.string   "coupon_code"
    t.string   "coupon_note"
    t.string   "email_if_shared"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
