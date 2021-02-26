class Island < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

   include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }

  # REFERENCES
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  # VALIDATIONS
  validates :name, presence: true
  validates :bedrooms, inclusion: { in: 0..10 }
  validates :location, presence: true
  validates :price_cents, presence: true
  validates :description, presence: true
  validates :max_guests, presence: true
  # validates :photo, presence: true
  # Stripe
  monetize :price_cents
end
