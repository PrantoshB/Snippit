class AddCodeSnippetRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :code_snippet, null: false, foreign_key: true
  end
end
