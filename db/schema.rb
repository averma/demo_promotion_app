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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120531144753) do

  create_table "businesses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "business_id",                       :null => false
    t.float    "retail_price",                      :null => false
    t.float    "discounted_price", :default => 0.0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "promotion_details", :force => true do |t|
    t.integer  "promotion_id"
    t.integer  "business_id"
    t.integer  "product_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "promotions", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "title",             :null => false
    t.string   "subtitle"
    t.date     "start_date",        :null => false
    t.date     "end_date",          :null => false
    t.text     "description"
    t.text     "redemption_detail"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
