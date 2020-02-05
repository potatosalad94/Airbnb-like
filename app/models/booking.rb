class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_guests, presence: true
end
