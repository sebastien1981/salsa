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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_085930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dances", force: :cascade do |t|
    t.string "fullname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "type_of_dance"
    t.string "level"
    t.string "school_name"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "beginning_of_time"
    t.time "end_of_time"
    t.string "day_of_week"
    t.integer "room_number"
    t.string "teacher_name"
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "school_teachers", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_teachers_on_school_id"
    t.index ["teacher_id"], name: "index_school_teachers_on_teacher_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "approval_number"
    t.string "phone_number"
    t.string "address_mail_pdt"
    t.string "phone_number_pdt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.string "address"
    t.string "type_of_structure"
    t.integer "number_room"
    t.float "longitude"
    t.float "latitude"
    t.index ["school_id"], name: "index_schools_on_school_id"
  end

  create_table "teacher_dances", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "dance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dance_id"], name: "index_teacher_dances_on_dance_id"
    t.index ["teacher_id"], name: "index_teacher_dances_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone_number"
    t.string "address_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_schools", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_user_schools_on_school_id"
    t.index ["user_id"], name: "index_user_schools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "school_classes", "schools"
  add_foreign_key "school_teachers", "schools"
  add_foreign_key "school_teachers", "teachers"
  add_foreign_key "schools", "schools"
  add_foreign_key "teacher_dances", "dances"
  add_foreign_key "teacher_dances", "teachers"
  add_foreign_key "user_schools", "schools"
  add_foreign_key "user_schools", "users"
end
