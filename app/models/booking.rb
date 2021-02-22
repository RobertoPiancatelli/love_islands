class Booking < ApplicationRecord
  belongs_to :user

     validates :check_in, presence: true
     validates :check_out, presence: true
     validates :guests, presence: true
     validates :total_price, presence: true

end
