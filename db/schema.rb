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

ActiveRecord::Schema.define(version: 20160317165415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "club_name"
    t.string   "nick_name"
  end

  add_index "clubs", ["league_id"], name: "index_clubs_on_league_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "league_name"
    t.string   "short_name"
    t.string   "country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "player_name"
    t.integer  "club_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "position"
  end

  add_index "players", ["club_id"], name: "index_players_on_club_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "team_name"
    t.string   "goalkeeper"
    t.string   "defender_1"
    t.string   "defender_2"
    t.string   "defender_3"
    t.string   "defender_4"
    t.string   "midfielder_1"
    t.string   "midfielder_2"
    t.string   "midfielder_3"
    t.string   "midfielder_4"
    t.string   "midfielder_5"
    t.string   "forward"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "clubs", "leagues"
  add_foreign_key "players", "clubs"
  add_foreign_key "teams", "users"
end
