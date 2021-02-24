class Island < ApplicationRecord
  # REFERENCES
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  # VALIDATIONS
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :max_guests, presence: true
  validates :photo, presence: true

end
