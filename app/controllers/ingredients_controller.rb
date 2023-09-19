class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id]) # Assuming you have a route like /recipes/:recipe_id/ingredients/new
    @ingredient = Ingredient.new
  end

   def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient.recipe, notice: 'Ingredient was successfully added.'
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end  

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to recipe_path(params[:recipe_id]), notice: "Ingredient updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(params[:recipe_id]), notice: "Ingredient updated successfully."
  end
   
  private

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :recipe_id, :quantity, :value)
  end
end
