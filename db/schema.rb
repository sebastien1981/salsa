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

ActiveRecord::Schema[7.0].define(version: 2023_09_29_152911) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_class_levels", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.bigint "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_school_class_levels_on_level_id"
    t.index ["school_class_id"], name: "index_school_class_levels_on_school_class_id"
  end

  create_table "school_class_teachers", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "school_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_school_class_teachers_on_school_class_id"
    t.index ["teacher_id"], name: "index_school_class_teachers_on_teacher_id"
  end

  create_table "school_class_type_of_dances", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.bigint "type_of_dance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_school_class_type_of_dances_on_level_id"
    t.index ["type_of_dance_id"], name: "index_school_class_type_of_dances_on_type_of_dance_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "end_of_time"
    t.time "beginning_of_time"
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "approval_number"
    t.string "phone_number"
    t.string "address_mail_pdt"
    t.string "phone_number_pdt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_schools_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_dances", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "school_class_levels", "levels"
  add_foreign_key "school_class_levels", "school_classes"
  add_foreign_key "school_class_teachers", "school_classes"
  add_foreign_key "school_class_teachers", "teachers"
  add_foreign_key "school_class_type_of_dances", "levels"
  add_foreign_key "school_class_type_of_dances", "type_of_dances"
  add_foreign_key "school_classes", "schools"
  add_foreign_key "schools", "schools"
  add_foreign_key "user_schools", "schools"
  add_foreign_key "user_schools", "users"
end
