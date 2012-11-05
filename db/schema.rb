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

ActiveRecord::Schema.define(:version => 20121105093648) do

  create_table "zones", :force => true do |t|
    t.integer  "blz_id"
    t.string   "title_cn"
    t.string   "title_en"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "zones", ["blz_id"], :name => "index_zones_on_blz_id"
  add_index "zones", ["parent_id"], :name => "index_zones_on_parent_id"
  add_index "zones", ["title_cn"], :name => "index_zones_on_title_cn"
  add_index "zones", ["title_en"], :name => "index_zones_on_title_en"

end
