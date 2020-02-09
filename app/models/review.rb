class Review < ApplicationRecord
  RATING = [1, 2, 3, 4, 5]
  belongs_to :flat
  belongs_to :user
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: RATING }
end
