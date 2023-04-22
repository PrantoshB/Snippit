class CodeSnippet < ApplicationRecord
    validates :title, presence: true, length: {maximum: 50}
    validates :description, presence: true, length: {maximum: 300}
end
