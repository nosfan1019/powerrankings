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

ActiveRecord::Schema.define(:version => 20130131052318) do

  create_table "averages", :force => true do |t|
    t.integer  "average"
    t.integer  "team_id"
    t.integer  "sport_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rankings", :force => true do |t|
    t.string   "rank"
    t.integer  "team_id"
    t.integer  "sport_id"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "week"
    t.datetime "date"
  end

  create_table "relocates", :force => true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "publisher"
    t.text     "url"
    t.integer  "sport_id"
    t.string   "scraper"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "sport"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "team"
    t.integer  "sport_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testers", :force => true do |t|
    t.string   "name"
    t.integer  "num"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
