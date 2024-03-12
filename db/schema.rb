# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_11_075859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "venue"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "ics_no"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_category_id"
    t.integer "serial_num"
    t.string "email"
    t.string "phone"
    t.index ["course_category_id"], name: "index_participants_on_course_category_id"
  end

  add_foreign_key "participants", "course_categories"
end
