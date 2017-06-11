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

ActiveRecord::Schema.define(version: 20170601084105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_infos", force: :cascade do |t|
    t.datetime "end_time"
    t.string   "learned_concept_id"
    t.float    "result"
    t.datetime "start_time"
    t.string   "assessment_id"
    t.string   "student_user_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "level",             null: false
    t.decimal "min_passing_grade", null: false
    t.integer "concept_id",        null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "content"
    t.string "letter"
  end

  create_table "concept_prerequisites", force: :cascade do |t|
    t.integer "concept_id",      null: false
    t.integer "prerequisite_id", null: false
  end

  create_table "concept_resources", force: :cascade do |t|
    t.integer  "presentation_mode"
    t.integer  "resource_type"
    t.integer  "concept_id"
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "resource_updated_at"
  end

  create_table "concepts", force: :cascade do |t|
    t.integer "level",     null: false
    t.string  "title"
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.float    "allowed_time_gap", null: false
    t.string   "description"
    t.datetime "end_date"
    t.float    "passing_grade",    null: false
    t.datetime "start_date"
    t.string   "title"
  end

  create_table "grade_level", force: :cascade do |t|
    t.integer "grade"
    t.float   "maxMark", null: false
    t.float   "minMark", null: false
  end

  create_table "learned_concepts", force: :cascade do |t|
    t.integer  "learned_course_id"
    t.datetime "end_time"
    t.datetime "start_time"
    t.integer  "concept_id"
    t.integer  "resource_id"
    t.boolean  "completed",         null: false
  end

  create_table "learned_courses", force: :cascade do |t|
    t.float   "completion_level", null: false
    t.integer "current_concept"
    t.float   "current_grade"
    t.string  "starting_level"
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "learner_preferences", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "preference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "presentation_mode"
    t.integer "resource_type"
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer "choice_id"
    t.text    "explanation"
    t.string  "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string  "DTYPE",               null: false
    t.integer "average_time",        null: false
    t.string  "question_string"
    t.integer "question_type"
    t.string  "target_concept"
    t.string  "answer"
    t.text    "test_code"
    t.integer "difficulty_level_id"
    t.integer "assessment_id",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                                null: false
    t.string   "language"
    t.string   "type"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
