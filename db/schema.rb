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

ActiveRecord::Schema[7.0].define(version: 2022_12_06_040038) do
  create_table "appointments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "branch_office_id"
    t.integer "bank_staff_id"
    t.string "motive"
    t.string "status", default: "pendiente"
    t.datetime "date"
    t.time "hour"
    t.string "description_result"
    t.index ["branch_office_id"], name: "index_appointments_on_branch_office_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "bank_staffs", force: :cascade do |t|
    t.integer "branch_office_id"
    t.index ["branch_office_id"], name: "index_bank_staffs_on_branch_office_id"
  end

  create_table "branch_offices", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "phone"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
  end

  create_table "rols", force: :cascade do |t|
    t.string "name"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "branch_office_id"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.index ["branch_office_id"], name: "index_schedules_on_branch_office_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "rol_id"
    t.integer "branch_office_id"
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["branch_office_id"], name: "index_users_on_branch_office_id"
    t.index ["rol_id"], name: "index_users_on_rol_id"
  end

  add_foreign_key "appointments", "branch_offices"
  add_foreign_key "appointments", "users"
  add_foreign_key "bank_staffs", "branch_offices"
  add_foreign_key "schedules", "branch_offices"
  add_foreign_key "users", "branch_offices"
  add_foreign_key "users", "rols"
end
