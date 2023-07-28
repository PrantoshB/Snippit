class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :snippet

  validates :stars, presence: true, numericality: { greater_than: 1, less_than_or_equal_to: 5, only_integer: true }

  after_save :update_stars

  private

  def update_stars
    snippet.update_stars_counter
  end
end
