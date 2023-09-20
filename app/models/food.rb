class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :food, presence: true
  validates :measurement_unit, presence: true
  validates :unit_price, numericality: true # Use `numericality: true` to validate numericality
end
