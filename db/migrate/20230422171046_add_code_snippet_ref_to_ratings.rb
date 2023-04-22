class AddCodeSnippetRefToRatings < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :code_snippet, null: false, foreign_key: true
  end
end
