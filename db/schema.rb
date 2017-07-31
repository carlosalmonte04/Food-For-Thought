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

ActiveRecord::Schema.define(version: 20170731211932) do

  create_table "offers", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tutor_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "status"
    t.string "compensation"
    t.string "length"
    t.datetime "deadline"
    t.text "description"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "topic_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.text "comment"
    t.integer "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "time"
    t.string "status"
    t.integer "post_id"
    t.integer "student_id"
    t.integer "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "slack"
    t.text "description"
    t.string "cohort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
