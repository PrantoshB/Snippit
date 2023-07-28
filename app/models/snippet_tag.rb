class SnippetTag < ApplicationRecord
  belongs_to :snippet
  belongs_to :tag
end
