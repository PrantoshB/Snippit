class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :code_snippets, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_create :set_default_values

  def self.top_contributors(limit = 3)
    order(code_snippets_counter: :desc).limit(limit)
  end

  private 

  def set_default_values
    self.code_snippets_counter ||= 0
  end
end
