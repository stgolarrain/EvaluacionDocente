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

ActiveRecord::Schema.define(version: 20140603030914) do

  create_table "academic_units", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campus_courses", id: false, force: true do |t|
    t.integer "campu_id"
    t.integer "course_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "acronym"
    t.integer  "academic_unit_id"
    t.integer  "teacher_id"
    t.string   "semester_references"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["academic_unit_id"], name: "index_courses_on_academic_unit_id"
  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id"

  create_table "semesters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
