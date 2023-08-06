class InitSchema < ActiveRecord::Migration[7.0]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "bookmarks" do |t|
      t.bigint "snippet_id", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["snippet_id"], name: "index_bookmarks_on_snippet_id"
      t.index ["user_id"], name: "index_bookmarks_on_user_id"
    end
    create_table "comments" do |t|
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "snippet_id", null: false
      t.bigint "user_id", null: false
      t.index ["snippet_id"], name: "index_comments_on_snippet_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
    create_table "snippets" do |t|
      t.string "title"
      t.text "description"
      t.text "code"
      t.string "language"
      t.integer "stars_counter"
      t.integer "comments_counter"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_snippets_on_user_id"
    end
    create_table "stars" do |t|
      t.bigint "snippet_id", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["snippet_id"], name: "index_stars_on_snippet_id"
      t.index ["user_id"], name: "index_stars_on_user_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "name"
      t.string "bio"
      t.string "avatar_url"
      t.boolean "admin"
      t.bigint "snippets_counter"
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
    add_foreign_key "bookmarks", "snippets"
    add_foreign_key "bookmarks", "users"
    add_foreign_key "comments", "snippets"
    add_foreign_key "comments", "users"
    add_foreign_key "snippets", "users"
    add_foreign_key "stars", "snippets"
    add_foreign_key "stars", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
