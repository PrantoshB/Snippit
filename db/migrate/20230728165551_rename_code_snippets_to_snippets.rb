class RenameCodeSnippetsToSnippets < ActiveRecord::Migration[7.0]
  def change
    rename_table :code_snippets, :snippets
  end
end
