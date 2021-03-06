# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2017_07_29_092408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_infos", force: :cascade do |t|
    t.datetime "end_time"
    t.float "result"
    t.datetime "start_time"
    t.string "assessment_id"
    t.string "student_user_id"
    t.integer "learned_concept_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "level", null: false
    t.decimal "min_passing_grade", null: false
    t.integer "concept_id", null: false
    t.string "title"
  end

  create_table "authors", force: :cascade do |t|
    t.string "user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "content"
    t.string "letter"
    t.integer "question_id"
  end

  create_table "concept_prerequisites", force: :cascade do |t|
    t.integer "concept_id", null: false
    t.integer "prerequisite_id", null: false
  end

  create_table "concept_resources", force: :cascade do |t|
    t.integer "presentation_mode"
    t.integer "resource_type"
    t.integer "concept_id"
    t.string "resource_file_name"
    t.string "resource_content_type"
    t.bigint "resource_file_size"
    t.datetime "resource_updated_at"
  end

  create_table "concepts", force: :cascade do |t|
    t.integer "level", null: false
    t.string "title"
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.float "allowed_time_gap", null: false
    t.string "description"
    t.datetime "end_date"
    t.float "passing_grade", null: false
    t.datetime "start_date"
    t.string "title"
  end

  create_table "grade_level", force: :cascade do |t|
    t.integer "grade"
    t.float "maxMark", null: false
    t.float "minMark", null: false
  end

  create_table "learned_concepts", force: :cascade do |t|
    t.integer "learned_course_id"
    t.datetime "end_time"
    t.datetime "start_time"
    t.integer "concept_id"
    t.integer "resource_id"
    t.boolean "completed", null: false
  end

  create_table "learned_courses", force: :cascade do |t|
    t.float "completion_level", null: false
    t.integer "current_concept"
    t.float "current_grade", default: 0.0
    t.string "starting_level"
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "learner_preferences", force: :cascade do |t|
    t.integer "student_id"
    t.integer "preference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "presentation_mode"
    t.integer "resource_type"
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer "choice_id"
    t.text "explanation"
    t.string "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "average_time", null: false
    t.string "question_string"
    t.integer "question_type"
    t.string "answer"
    t.integer "difficulty_level_id"
    t.integer "assessment_id", null: false
    t.integer "target_concept"
    t.integer "num_of_answers"
  end

  create_table "student_answers", force: :cascade do |t|
    t.integer "assessment_info_id"
    t.integer "question_id"
    t.integer "answer_choice_id"
    t.string "answer_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "correct"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.string "language"
    t.string "type"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
