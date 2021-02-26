class Order < ApplicationRecord
  belongs_to :booking
  monetize :amount_cents
end
