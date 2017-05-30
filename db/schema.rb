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

ActiveRecord::Schema.define(version: 20170530084708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "quizz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.index ["quizz_id"], name: "index_cards_on_quizz_id", using: :btree
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_classrooms_on_user_id", using: :btree
  end

  create_table "quizzs", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzs_on_user_id", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "quizz_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["classroom_id"], name: "index_shares_on_classroom_id", using: :btree
    t.index ["quizz_id"], name: "index_shares_on_quizz_id", using: :btree
  end

  create_table "student_evaluations", force: :cascade do |t|
    t.integer  "evaluation"
    t.integer  "card_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_student_evaluations_on_card_id", using: :btree
    t.index ["user_id"], name: "index_student_evaluations_on_user_id", using: :btree
  end

  create_table "user_classrooms", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["classroom_id"], name: "index_user_classrooms_on_classroom_id", using: :btree
    t.index ["user_id"], name: "index_user_classrooms_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cards", "quizzs"
  add_foreign_key "classrooms", "users"
  add_foreign_key "quizzs", "users"
  add_foreign_key "shares", "classrooms"
  add_foreign_key "shares", "quizzs"
  add_foreign_key "student_evaluations", "cards"
  add_foreign_key "student_evaluations", "users"
  add_foreign_key "user_classrooms", "classrooms"
  add_foreign_key "user_classrooms", "users"
end
