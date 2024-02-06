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

ActiveRecord::Schema[7.1].define(version: 2024_02_06_000811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountants", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_accountants_on_user_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "section"
    t.string "name"
    t.string "classement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_teachers", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_teachers_on_course_id"
    t.index ["teacher_id"], name: "index_course_teachers_on_teacher_id"
    t.index ["year_id"], name: "index_course_teachers_on_year_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.float "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "classroom_id"
    t.index ["classroom_id"], name: "index_courses_on_classroom_id"
  end

  create_table "detail_paiement_classrooms", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "detail_paiement_id"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_detail_paiement_classrooms_on_classroom_id"
    t.index ["detail_paiement_id"], name: "index_detail_paiement_classrooms_on_detail_paiement_id"
    t.index ["year_id"], name: "index_detail_paiement_classrooms_on_year_id"
  end

  create_table "detail_paiements", force: :cascade do |t|
    t.string "frais_name"
    t.float "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
  end

  create_table "discipline_directors", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_discipline_directors_on_user_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.float "point"
    t.float "maximum"
    t.datetime "date"
    t.bigint "promotion_id"
    t.bigint "course_id"
    t.bigint "periode_id"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_evaluations_on_course_id"
    t.index ["periode_id"], name: "index_evaluations_on_periode_id"
    t.index ["promotion_id"], name: "index_evaluations_on_promotion_id"
    t.index ["year_id"], name: "index_evaluations_on_year_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.text "contenu"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observation_disciplinaries", force: :cascade do |t|
    t.date "date"
    t.text "observation"
    t.bigint "discipline_director_id"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_director_id"], name: "index_observation_disciplinaries_on_discipline_director_id"
    t.index ["promotion_id"], name: "index_observation_disciplinaries_on_promotion_id"
  end

  create_table "paiements", force: :cascade do |t|
    t.date "date"
    t.float "montant"
    t.float "reste"
    t.bigint "promotion_id"
    t.bigint "accountant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountant_id"], name: "index_paiements_on_accountant_id"
    t.index ["promotion_id"], name: "index_paiements_on_promotion_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "periodes", force: :cascade do |t|
    t.string "name"
    t.integer "during_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "year_id"
    t.bigint "classroom_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_promotions_on_classroom_id"
    t.index ["student_id"], name: "index_promotions_on_student_id"
    t.index ["year_id"], name: "index_promotions_on_year_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.integer "first_H"
    t.integer "second_H"
    t.integer "third_H"
    t.integer "fourth_H"
    t.integer "fifth_H"
    t.integer "sixth_H"
    t.integer "seven_H"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_schedules_on_classroom_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "studies_directors", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studies_directors_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accountants", "users"
  add_foreign_key "course_teachers", "courses"
  add_foreign_key "course_teachers", "teachers"
  add_foreign_key "course_teachers", "years"
  add_foreign_key "courses", "classrooms"
  add_foreign_key "detail_paiement_classrooms", "classrooms"
  add_foreign_key "detail_paiement_classrooms", "detail_paiements"
  add_foreign_key "detail_paiement_classrooms", "years"
  add_foreign_key "discipline_directors", "users"
  add_foreign_key "evaluations", "courses"
  add_foreign_key "evaluations", "periodes"
  add_foreign_key "evaluations", "promotions"
  add_foreign_key "evaluations", "years"
  add_foreign_key "observation_disciplinaries", "discipline_directors"
  add_foreign_key "observation_disciplinaries", "promotions"
  add_foreign_key "paiements", "accountants"
  add_foreign_key "paiements", "promotions"
  add_foreign_key "parents", "users"
  add_foreign_key "promotions", "classrooms"
  add_foreign_key "promotions", "students"
  add_foreign_key "promotions", "years"
  add_foreign_key "schedules", "classrooms"
  add_foreign_key "students", "parents"
  add_foreign_key "students", "users"
  add_foreign_key "studies_directors", "users"
  add_foreign_key "teachers", "users"
end
