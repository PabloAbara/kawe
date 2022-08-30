# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_825_201_110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roadmap_id", null: false
    t.index ["roadmap_id"], name: "index_checkpoints_on_roadmap_id"
  end

  create_table "completed_checkpoints", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "checkpoint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkpoint_id"], name: "index_completed_checkpoints_on_checkpoint_id"
    t.index ["user_id"], name: "index_completed_checkpoints_on_user_id"
  end

  create_table "resource_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resource_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_ratings_on_resource_id"
    t.index ["user_id"], name: "index_resource_ratings_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.bigint "checkpoint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkpoint_id"], name: "index_resources_on_checkpoint_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "title"
    t.string "project_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "checkpoints", "roadmaps"
  add_foreign_key "completed_checkpoints", "checkpoints"
  add_foreign_key "completed_checkpoints", "users"
  add_foreign_key "resource_ratings", "resources"
  add_foreign_key "resource_ratings", "users"
  add_foreign_key "resources", "checkpoints"
end
