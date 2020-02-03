class Flat < ApplicationRecord
  has_many   :bookings
  belongs_to :user
  has_one_attached :photo
  validates  :name, presence: true, uniqueness: { scope: :address }
  validates  :city, presence: true
  validates  :address, presence: true
  validates  :price_in_cents, presence: true, numericality: { only_integer: true }
  validates  :max_guests, presence: true
end
