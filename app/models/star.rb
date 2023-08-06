class Star < ApplicationRecord
  belongs_to :snippet
  belongs_to :user

  after_save :increase_stars
  after_destroy :decrese_stars

  private

  def increase_stars
    snippet.increment!(:stars_counter)
  end

  def decrese_stars
    snippet.decrement!(:stars_counter)
  end
end
