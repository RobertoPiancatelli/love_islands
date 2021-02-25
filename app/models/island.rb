class Island < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # REFERENCES
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  # VALIDATIONS
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :max_guests, presence: true
  validates :photo, presence: true
end
