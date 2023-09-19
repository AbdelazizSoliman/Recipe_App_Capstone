class AddPublicRecipeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :public_recipe, :boolean, default: false
  end
end
