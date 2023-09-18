class Food < ApplicationRecord
  belongs_to :user

  validates :food, presence: true
  validates :measurement_unit, presence: true
  validates :unit_price, numericality: true # Use `numericality: true` to validate numericality
end
