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

ActiveRecord::Schema.define(:version => 20121106093157) do

  create_table "pets", :force => true do |t|
    t.integer  "blz_id"
    t.string   "title_cn"
    t.string   "title_en"
    t.text     "description"
    t.string   "status"
    t.string   "icon_url"
    t.string   "source"
    t.string   "event"
    t.string   "weather"
    t.string   "season"
    t.string   "nga_url"
    t.integer  "category_id"
    t.string   "url_param"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pets", ["blz_id"], :name => "index_pets_on_blz_id"
  add_index "pets", ["category_id"], :name => "index_pets_on_category_id"
  add_index "pets", ["event"], :name => "index_pets_on_event"
  add_index "pets", ["season"], :name => "index_pets_on_season"
  add_index "pets", ["source"], :name => "index_pets_on_source"
  add_index "pets", ["title_cn"], :name => "index_pets_on_title_cn"
  add_index "pets", ["title_en"], :name => "index_pets_on_title_en"
  add_index "pets", ["url_param"], :name => "index_pets_on_url_param"
  add_index "pets", ["weather"], :name => "index_pets_on_weather"

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
