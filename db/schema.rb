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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_135035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "checkpoints", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roadmap_id", null: false
    t.index ["roadmap_id"], name: "index_checkpoints_on_roadmap_id"
    t.index ["title", "roadmap_id"], name: "index_checkpoints_on_title_and_roadmap_id", unique: true
  end

  create_table "completed_checkpoints", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "checkpoint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkpoint_id"], name: "index_completed_checkpoints_on_checkpoint_id"
    t.index ["user_id", "checkpoint_id"], name: "index_completed_checkpoints_on_user_id_and_checkpoint_id", unique: true
    t.index ["user_id"], name: "index_completed_checkpoints_on_user_id"
  end

  create_table "resource_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resource_id", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_ratings_on_resource_id"
    t.index ["user_id", "resource_id"], name: "index_resource_ratings_on_user_id_and_resource_id", unique: true
    t.index ["user_id"], name: "index_resource_ratings_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title", null: false
    t.string "link", null: false
    t.bigint "checkpoint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkpoint_id"], name: "index_resources_on_checkpoint_id"
    t.index ["link", "checkpoint_id"], name: "index_resources_on_link_and_checkpoint_id", unique: true
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "title", null: false
    t.string "project_link", null: false
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
    t.string "name", null: false
    t.string "role", null: false
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
