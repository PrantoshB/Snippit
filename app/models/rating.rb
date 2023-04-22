class Rating < ApplicationRecord
    validates :stars, presence: true, numericality: {greater_than: 1, less_than_or_equal_to: 5, only_integer: true}
end
