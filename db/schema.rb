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

ActiveRecord::Schema[7.0].define(version: 2022_05_05_173830) do
  create_table "applicants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "contact_email", null: false
    t.string "company_name", null: false
    t.string "contact_whatsapp"
    t.string "contact_linked_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_applicants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "applicant_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url_token", null: false
    t.index ["applicant_id"], name: "index_jobs_applicants_on_applicant_id"
    t.index ["job_id"], name: "index_jobs_applicants_on_job_id"
  end

  create_table "jobs_applicants_pipelines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "jobs_applicant_id", null: false
    t.bigint "pipeline_id", null: false
    t.boolean "passed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "feedback"
    t.index ["jobs_applicant_id"], name: "index_jobs_applicants_pipelines_on_jobs_applicant_id"
    t.index ["pipeline_id"], name: "index_jobs_applicants_pipelines_on_pipeline_id"
  end

  create_table "pipelines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "order", null: false
    t.bigint "job_id", null: false
    t.bigint "attendant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendant_id"], name: "index_pipelines_on_attendant_id"
    t.index ["job_id"], name: "index_pipelines_on_job_id"
  end

  add_foreign_key "jobs_applicants", "applicants"
  add_foreign_key "jobs_applicants", "jobs"
  add_foreign_key "jobs_applicants_pipelines", "jobs_applicants"
  add_foreign_key "jobs_applicants_pipelines", "pipelines"
  add_foreign_key "pipelines", "attendants"
  add_foreign_key "pipelines", "jobs"
end
