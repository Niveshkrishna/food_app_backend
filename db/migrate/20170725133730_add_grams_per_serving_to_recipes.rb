class AddGramsPerServingToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :grams_per_serving, :integer
  end
end
