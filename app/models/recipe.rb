class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :public_recipe, inclusion: { in: [true, false] }
end
