class Flat < ApplicationRecord
  has_many   :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  monetize :price_in_cents, as: "price"
  validates  :name, presence: true, uniqueness: { scope: :address }
  validates  :city, presence: true
  validates  :address, presence: true
  validates  :price_in_cents, presence: true, numericality: { only_integer: true }
  validates  :max_guests, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
