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

ActiveRecord::Schema[7.0].define(version: 2023_08_27_085822) do
  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.text "title"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_procedures_on_group_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.integer "stage_id", null: false
    t.integer "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_projects_on_procedure_id"
    t.index ["stage_id"], name: "index_projects_on_stage_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "title"
    t.integer "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stage_number"
    t.index ["procedure_id"], name: "index_stages_on_procedure_id"
  end

  add_foreign_key "procedures", "groups"
  add_foreign_key "projects", "procedures"
  add_foreign_key "projects", "stages"
  add_foreign_key "stages", "procedures"
end
