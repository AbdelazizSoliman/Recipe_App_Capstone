# spec/models/recipe_spec.rb
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      recipe = Recipe.new(
        description: 'A test recipe',
        preparation_time: 30,
        cooking_time: 45,
        public_recipe: true
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a description' do
      recipe = Recipe.new(
        name: 'Test Recipe',
        preparation_time: 30,
        cooking_time: 45,
        public_recipe: true
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid with a negative preparation_time' do
      recipe = Recipe.new(
        name: 'Test Recipe',
        description: 'A test recipe',
        preparation_time: -10,
        cooking_time: 45,
        public_recipe: true
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid with a negative cooking_time' do
      recipe = Recipe.new(
        name: 'Test Recipe',
        description: 'A test recipe',
        preparation_time: 30,
        cooking_time: -10,
        public_recipe: true
      )
      expect(recipe).not_to be_valid
    end

    it 'is not valid without public_recipe' do
      recipe = Recipe.new(
        name: 'Test Recipe',
        description: 'A test recipe',
        preparation_time: 30,
        cooking_time: 45
      )
      expect(recipe).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many ingredients' do
      association = described_class.reflect_on_association(:ingredients)
      expect(association.macro).to eq(:has_many)
    end
  end
end
