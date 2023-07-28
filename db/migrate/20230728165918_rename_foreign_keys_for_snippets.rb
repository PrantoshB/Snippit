class RenameForeignKeysForSnippets < ActiveRecord::Migration[7.0]
  def change
    rename_column :stars, :code_snippet_id, :snippet_id 
    rename_column :comments, :code_snippet_id, :snippet_id 
    rename_column :bookmarks, :code_snippet_id, :snippet_id
  end
end
