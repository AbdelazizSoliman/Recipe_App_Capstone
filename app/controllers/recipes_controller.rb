class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
