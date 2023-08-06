class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :snippets, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_create :set_default_values

  def self.top_contributors(limit = 3)
    order(snippets_counter: :desc).limit(limit)
  end

  def find_star(snippet)
    stars.find_by(snippet:)
  end

  def find_bookmark(snippet)
    bookmarks.find_by(snippet:)
  end

  private

  def set_default_values
    self.snippets_counter ||= 0
  end
end
