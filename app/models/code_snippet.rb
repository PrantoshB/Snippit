class CodeSnippet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }

  before_create :increase_counter, :set_default_values
  before_destroy :decrease_counter

  def update_stars_counter
    update(stars_counter: ratings.average(:stars))
  end

  def self.most_popular(limit = 3)
    order(stars_counter: :desc).limit(limit)
  end

  private

  def increase_counter
    user.increment!(:code_snippets_counter)
  end

  def decrease_counter
    user.decrement!(:code_snippets_counter)
  end

  def set_default_values
    self.stars_counter ||= 0
    self.comments_counter ||= 0
  end
end
