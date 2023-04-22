class CodeSnippet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }

  def update_stars_counter
    update(stars_counter: ratings.sum(:stars))
  end
end
