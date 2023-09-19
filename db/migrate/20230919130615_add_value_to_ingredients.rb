class AddValueToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :value, :decimal
  end
end
