class Island < ApplicationRecord
  # REFERENCES
  belongs_to :user
  has_many :bookings
  # VALIDATIONS
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :max_guests, presence: true

end
