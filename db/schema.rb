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

ActiveRecord::Schema.define(version: 2013_03_02_162406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acquirings", id: :serial, force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "skill_id", null: false
    t.integer "acquire_level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acquire_level"], name: "index_acquirings_on_acquire_level"
    t.index ["pet_id"], name: "index_acquirings_on_pet_id"
    t.index ["skill_id"], name: "index_acquirings_on_skill_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.integer "blz_id"
    t.string "title_cn", limit: 255
    t.string "title_en", limit: 255
    t.string "icon_url", limit: 255
    t.text "features"
    t.integer "decay_id"
    t.integer "restrain_id"
    t.string "slug", limit: 255
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blz_id"], name: "index_categories_on_blz_id"
    t.index ["decay_id"], name: "index_categories_on_decay_id"
    t.index ["icon_url"], name: "index_categories_on_icon_url"
    t.index ["restrain_id"], name: "index_categories_on_restrain_id"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
    t.index ["title_cn"], name: "index_categories_on_title_cn"
    t.index ["title_en"], name: "index_categories_on_title_en"
  end

  create_table "pets", id: :serial, force: :cascade do |t|
    t.integer "blz_id"
    t.string "title_cn", limit: 255
    t.string "title_en", limit: 255
    t.text "description"
    t.string "status", limit: 255
    t.string "icon_url", limit: 255
    t.string "source", limit: 255
    t.string "event", limit: 255
    t.string "weather", limit: 255
    t.string "season", limit: 255
    t.string "nga_url", limit: 255
    t.integer "category_id"
    t.string "slug", limit: 255
    t.boolean "reviewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blz_id"], name: "index_pets_on_blz_id"
    t.index ["category_id"], name: "index_pets_on_category_id"
    t.index ["event"], name: "index_pets_on_event"
    t.index ["reviewed"], name: "index_pets_on_reviewed"
    t.index ["season"], name: "index_pets_on_season"
    t.index ["slug"], name: "index_pets_on_slug", unique: true
    t.index ["source"], name: "index_pets_on_source"
    t.index ["title_cn"], name: "index_pets_on_title_cn"
    t.index ["title_en"], name: "index_pets_on_title_en"
    t.index ["weather"], name: "index_pets_on_weather"
  end

  create_table "pets_zones", id: :serial, force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "zone_id", null: false
    t.index ["pet_id"], name: "index_pets_zones_on_pet_id"
    t.index ["zone_id"], name: "index_pets_zones_on_zone_id"
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.integer "blz_id", null: false
    t.string "title_cn", limit: 255, null: false
    t.string "title_en", limit: 255
    t.text "description"
    t.integer "hit_rate"
    t.integer "category_id", null: false
    t.integer "cd"
    t.string "status", limit: 255
    t.string "slug", limit: 255
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blz_id"], name: "index_skills_on_blz_id"
    t.index ["cd"], name: "index_skills_on_cd"
    t.index ["hit_rate"], name: "index_skills_on_hit_rate"
    t.index ["slug"], name: "index_skills_on_slug", unique: true
    t.index ["status"], name: "index_skills_on_status"
    t.index ["title_cn"], name: "index_skills_on_title_cn"
    t.index ["title_en"], name: "index_skills_on_title_en"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type", limit: 255
    t.integer "tagger_id"
    t.string "tagger_type", limit: 255
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "password_digest", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", id: :serial, force: :cascade do |t|
    t.integer "blz_id"
    t.string "title_cn", limit: 255
    t.string "title_en", limit: 255
    t.integer "parent_id"
    t.text "description"
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zone_level", limit: 255
    t.string "pet_level", limit: 255
    t.index ["blz_id"], name: "index_zones_on_blz_id"
    t.index ["parent_id"], name: "index_zones_on_parent_id"
    t.index ["pet_level"], name: "index_zones_on_pet_level"
    t.index ["slug"], name: "index_zones_on_slug", unique: true
    t.index ["title_cn"], name: "index_zones_on_title_cn"
    t.index ["title_en"], name: "index_zones_on_title_en"
    t.index ["zone_level"], name: "index_zones_on_zone_level"
  end

end
