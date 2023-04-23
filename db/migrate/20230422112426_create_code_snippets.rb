class CreateCodeSnippets < ActiveRecord::Migration[7.0]
  def change
    create_table :code_snippets do |t|
      t.string :title
      t.text :description
      t.text :code
      t.string :language
      t.integer :stars_counter
      t.integer :comments_counter

      t.timestamps
    end
  end
end
