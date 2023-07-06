class Star < ApplicationRecord
  belongs_to :code_snippet
  belongs_to :user
end
