class Star < ApplicationRecord
  belongs_to :code_snippet
  belongs_to :user

  after_save :increase_stars
  after_destroy :decrese_stars

  private

  def increase_stars
    code_snippet.increment!(:stars_counter)
  end

  def decrese_stars
    code_snippet.decrement!(:stars_counter)
  end
end
