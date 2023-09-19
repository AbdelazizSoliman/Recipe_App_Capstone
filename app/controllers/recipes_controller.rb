class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :toggle_public, :new_food]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def toggle_public
    @recipe = current_user.recipes.find(params[:id])
    @recipe.toggle!(:public_recipe)
    redirect_to recipe_path(@recipe)
  end

  def new_food
    @food = Food.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.ingredients.destroy_all
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe deleted successfully.'
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully.'
    else
      puts @recipe.errors.full_messages # Add this line for debugging
      render :new
    end
  end

  def public_list
    @public_recipes = Recipe.where(public_recipe: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
