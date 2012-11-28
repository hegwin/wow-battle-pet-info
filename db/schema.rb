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

ActiveRecord::Schema.define(:version => 20121128072748) do

  create_table "acquirings", :force => true do |t|
    t.integer  "pet_id",        :null => false
    t.integer  "skill_id",      :null => false
    t.integer  "acquire_level", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "acquirings", ["acquire_level"], :name => "index_acquirings_on_acquire_level"
  add_index "acquirings", ["pet_id"], :name => "index_acquirings_on_pet_id"
  add_index "acquirings", ["skill_id"], :name => "index_acquirings_on_skill_id"

  create_table "categories", :force => true do |t|
    t.integer  "blz_id"
    t.string   "title_cn"
    t.string   "title_en"
    t.string   "icon_url"
    t.text     "features"
    t.integer  "decay_id"
    t.integer  "restrain_id"
    t.string   "slug"
    t.text     "comments"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["blz_id"], :name => "index_categories_on_blz_id"
  add_index "categories", ["decay_id"], :name => "index_categories_on_decay_id"
  add_index "categories", ["icon_url"], :name => "index_categories_on_icon_url"
  add_index "categories", ["restrain_id"], :name => "index_categories_on_restrain_id"
  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true
  add_index "categories", ["title_cn"], :name => "index_categories_on_title_cn"
  add_index "categories", ["title_en"], :name => "index_categories_on_title_en"

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
    t.string   "slug"
    t.boolean  "reviewed",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "pets", ["blz_id"], :name => "index_pets_on_blz_id"
  add_index "pets", ["category_id"], :name => "index_pets_on_category_id"
  add_index "pets", ["event"], :name => "index_pets_on_event"
  add_index "pets", ["reviewed"], :name => "index_pets_on_reviewed"
  add_index "pets", ["season"], :name => "index_pets_on_season"
  add_index "pets", ["slug"], :name => "index_pets_on_slug", :unique => true
  add_index "pets", ["source"], :name => "index_pets_on_source"
  add_index "pets", ["title_cn"], :name => "index_pets_on_title_cn"
  add_index "pets", ["title_en"], :name => "index_pets_on_title_en"
  add_index "pets", ["weather"], :name => "index_pets_on_weather"

  create_table "pets_zones", :force => true do |t|
    t.integer "pet_id",  :null => false
    t.integer "zone_id", :null => false
  end

  add_index "pets_zones", ["pet_id"], :name => "index_pets_zones_on_pet_id"
  add_index "pets_zones", ["zone_id"], :name => "index_pets_zones_on_zone_id"

  create_table "skills", :force => true do |t|
    t.integer  "blz_id",      :null => false
    t.string   "title_cn",    :null => false
    t.string   "title_en"
    t.text     "description"
    t.integer  "hit_rate"
    t.integer  "category_id", :null => false
    t.integer  "cd"
    t.string   "status"
    t.string   "slug"
    t.text     "comments"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "skills", ["blz_id"], :name => "index_skills_on_blz_id"
  add_index "skills", ["cd"], :name => "index_skills_on_cd"
  add_index "skills", ["hit_rate"], :name => "index_skills_on_hit_rate"
  add_index "skills", ["slug"], :name => "index_skills_on_slug", :unique => true
  add_index "skills", ["status"], :name => "index_skills_on_status"
  add_index "skills", ["title_cn"], :name => "index_skills_on_title_cn"
  add_index "skills", ["title_en"], :name => "index_skills_on_title_en"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "zones", :force => true do |t|
    t.integer  "blz_id"
    t.string   "title_cn"
    t.string   "title_en"
    t.integer  "parent_id"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "zones", ["blz_id"], :name => "index_zones_on_blz_id"
  add_index "zones", ["parent_id"], :name => "index_zones_on_parent_id"
  add_index "zones", ["slug"], :name => "index_zones_on_slug", :unique => true
  add_index "zones", ["title_cn"], :name => "index_zones_on_title_cn"
  add_index "zones", ["title_en"], :name => "index_zones_on_title_en"

end
