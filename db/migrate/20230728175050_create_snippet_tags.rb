class CreateSnippetTags < ActiveRecord::Migration[7.0]
  def change
    create_table :snippet_tags do |t|
      t.references :snippet, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
