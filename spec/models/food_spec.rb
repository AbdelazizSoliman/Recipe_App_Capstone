require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'is not valid without a food' do
      food = Food.new(
        measurement_unit: 'g',
        unit_price: 5
      )
      expect(food).not_to be_valid
    end

    it 'is not valid without a measurement_unit' do
      food = Food.new(
        food: 'Test Food',
        unit_price: 5
      )
      expect(food).not_to be_valid
    end

    it 'is not valid without a unit_price' do
      food = Food.new(
        food: 'Test Food',
        measurement_unit: 'g'
      )
      expect(food).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq(:has_many)
    end
  end
end
