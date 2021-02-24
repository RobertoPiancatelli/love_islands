class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  has_many :reviews

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guests, presence: true
  validates :total_price, presence: true

  def calculate_total_price
    @total_price = 200
  end
end
