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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_081432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "code_snippets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "code"
    t.string "language"
    t.integer "stars_counter"
    t.integer "comments_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_code_snippets_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "code_snippet_id", null: false
    t.bigint "user_id", null: false
    t.index ["code_snippet_id"], name: "index_comments_on_code_snippet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "code_snippet_id", null: false
    t.index ["code_snippet_id"], name: "index_ratings_on_code_snippet_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "stars", force: :cascade do |t|
    t.bigint "code_snippet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_snippet_id"], name: "index_stars_on_code_snippet_id"
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "bio"
    t.string "avatar_url"
    t.boolean "admin"
    t.bigint "code_snippets_counter"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "code_snippets", "users"
  add_foreign_key "comments", "code_snippets"
  add_foreign_key "comments", "users"
  add_foreign_key "ratings", "code_snippets"
  add_foreign_key "ratings", "users"
  add_foreign_key "stars", "code_snippets"
  add_foreign_key "stars", "users"
end
