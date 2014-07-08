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

ActiveRecord::Schema.define(version: 20140706153413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bets", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "bet_type"
    t.decimal  "wager"
    t.decimal  "odds"
    t.boolean  "result"
    t.decimal  "gain"
    t.string   "status"
    t.uuid     "user_id"
    t.uuid     "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coin_transactions", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.decimal  "before_value"
    t.decimal  "after_value"
    t.string   "transaction_type"
    t.string   "bet_reference"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "follower_id"
    t.uuid     "followee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.uuid     "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_comments", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "content"
    t.uuid     "user_id"
    t.uuid     "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "venue"
    t.string   "sport"
    t.string   "league_day"
    t.boolean  "accepts_bets"
    t.decimal  "home_odds"
    t.decimal  "draw_odds"
    t.decimal  "away_odds"
    t.decimal  "over_under_value"
    t.decimal  "over_odds"
    t.decimal  "under_odds"
    t.decimal  "home_handicap_value"
    t.decimal  "away_handicap_value"
    t.decimal  "home_handicap_odds"
    t.decimal  "away_handicap_odds"
    t.integer  "home_score"
    t.integer  "away_score"
    t.uuid     "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_comments", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "content"
    t.uuid     "profile_commentor_id"
    t.uuid     "profile_commentee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrants", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email"
    t.string   "registration_code"
    t.datetime "registration_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "salt"
    t.string   "fish"
    t.string   "description"
    t.string   "home_country"
    t.string   "home_town"
    t.string   "website"
    t.string   "password_reset_code"
    t.datetime "password_reset_expires_at"
    t.decimal  "coins"
    t.decimal  "win_percentage"
    t.integer  "current_streak"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
