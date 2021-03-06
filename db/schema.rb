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

ActiveRecord::Schema.define(version: 20180126151740) do

  create_table "cell_blocks", force: :cascade do |t|
    t.string "name"
    t.integer "security_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cells", force: :cascade do |t|
    t.string "name"
    t.integer "cell_block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_block_id"], name: "index_cells_on_cell_block_id"
  end

  create_table "guard_prisoners", force: :cascade do |t|
    t.integer "guard_id"
    t.integer "prisoner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guard_id"], name: "index_guard_prisoners_on_guard_id"
    t.index ["prisoner_id"], name: "index_guard_prisoners_on_prisoner_id"
  end

  create_table "guards", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "cell_block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.index ["cell_block_id"], name: "index_guards_on_cell_block_id"
  end

  create_table "incident_participants", force: :cascade do |t|
    t.integer "incident_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prisoner_type"
    t.integer "prisoner_id"
    t.index ["incident_report_id"], name: "index_incident_participants_on_incident_report_id"
    t.index ["prisoner_id"], name: "index_incident_participants_on_prisoner_id"
  end

  create_table "incident_reports", force: :cascade do |t|
    t.text "content"
    t.integer "incident_type_id"
    t.integer "guard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guard_id"], name: "index_incident_reports_on_guard_id"
    t.index ["incident_type_id"], name: "index_incident_reports_on_incident_type_id"
  end

  create_table "incident_types", force: :cascade do |t|
    t.string "name"
    t.integer "severity_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prisoner_badges", force: :cascade do |t|
    t.integer "prisoner_id"
    t.string "name"
    t.index ["prisoner_id"], name: "index_prisoner_badges_on_prisoner_id"
  end

  create_table "prisoners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "release_date"
    t.string "conviction"
    t.integer "cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.datetime "intake_date"
    t.index ["cell_id"], name: "index_prisoners_on_cell_id"
  end

end
