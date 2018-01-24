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

ActiveRecord::Schema.define(version: 20180124043029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date_start"
    t.date "date_end"
    t.datetime "time_start"
    t.datetime "time_end"
    t.string "url"
    t.string "source"
    t.string "source_id"
    t.string "image_url"
    t.string "event_address"
    t.float "event_longitude"
    t.float "event_lattitude"
    t.boolean "golden?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_pairings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "pairing_id"
    t.index ["event_id"], name: "index_events_pairings_on_event_id"
    t.index ["pairing_id"], name: "index_events_pairings_on_pairing_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "interest_rank"
    t.boolean "private?"
    t.boolean "priority?"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_interests_on_event_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "pairing_id"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_likes_on_event_id"
    t.index ["pairing_id"], name: "index_likes_on_pairing_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "pairings", force: :cascade do |t|
    t.float "rating"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pairings_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pairing_id"
    t.index ["pairing_id"], name: "index_pairings_users_on_pairing_id"
    t.index ["user_id"], name: "index_pairings_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "hashed_password"
    t.string "description"
    t.string "gender"
    t.boolean "interested_m?"
    t.boolean "interested_f?"
    t.date "birthday"
    t.string "education"
    t.string "work"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
