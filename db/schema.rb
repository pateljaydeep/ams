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

ActiveRecord::Schema.define(:version => 20130610161121) do

  create_table "asset_allocation_histories", :force => true do |t|
    t.string   "assignee_id"
    t.string   "assignee_name"
    t.date     "assigned_date"
    t.date     "returned_date"
    t.integer  "asset_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "asset_assignments", :force => true do |t|
    t.string   "assignee_id"
    t.string   "assignee_name"
    t.date     "assigned_date"
    t.integer  "asset_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "asset_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assets", :force => true do |t|
    t.string   "asset_id"
    t.string   "manufacturer"
    t.integer  "asset_type_id"
    t.text     "description"
    t.date     "purchase_date"
    t.date     "release_date"
    t.string   "asset_image"
    t.string   "asset_documents"
    t.string   "serial_number"
    t.string   "model"
    t.string   "display_size"
    t.string   "operating_system"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "retired",          :default => false
    t.date     "make_year"
    t.boolean  "bounded",          :default => false
    t.boolean  "asset_bounded",    :default => false
  end

end
