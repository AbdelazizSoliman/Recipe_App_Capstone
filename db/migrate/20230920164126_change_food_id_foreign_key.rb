class ChangeFoodIdForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :ingredients, :foods  # Remove the existing foreign key
    add_foreign_key :ingredients, :foods, on_delete: :cascade  # Add the new foreign key
  end
end
