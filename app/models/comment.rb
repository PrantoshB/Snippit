class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :code_snippet

  validates :content, presence: true, length: { maximum: 150 }

  after_save :increase_counter
  before_destroy :decrease_counter

  private

  def increase_counter
    code_snippet.increment!(:comments_counter)
  end

  def decrease_counter
    code_snippet.decrement!(:comments_counter)
  end
end
