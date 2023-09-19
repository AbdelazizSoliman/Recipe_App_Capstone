class Ingredient < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true
  validates :value, presence: true
end
