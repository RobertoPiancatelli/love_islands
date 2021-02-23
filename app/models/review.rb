class Review < ApplicationRecord
  # REFERENCES
  belongs_to :booking
  # VALIDATIONS
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
