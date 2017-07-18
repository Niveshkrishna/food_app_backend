class AddQuantityAndTypeToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :quantity, :float
    add_column :ingredients, :quantity_type, :string
  end
end
