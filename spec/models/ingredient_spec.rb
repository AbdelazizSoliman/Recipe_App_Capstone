# spec/models/ingredient_spec.rb

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it 'is not valid without a quantity' do
      ingredient = Ingredient.new(
        value: 'grams'
      )
      expect(ingredient).not_to be_valid
      expect(ingredient.errors[:quantity]).to include("can't be blank")
    end

    it 'is not valid without a value' do
      ingredient = Ingredient.new(
        quantity: 100
      )
      expect(ingredient).not_to be_valid
      expect(ingredient.errors[:value]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to a food' do
      association = described_class.reflect_on_association(:food)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a recipe' do
      association = described_class.reflect_on_association(:recipe)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
