class ChangeFoodColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :name, :string
    remove_column :foods, :quantity, :integer
    add_column :foods, :food, :string
    add_column :foods, :measurement_unit, :string
    add_column :foods, :unit_price, :integer
  end
end
