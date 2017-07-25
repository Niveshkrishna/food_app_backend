class AddRecipeIdToNutrition < ActiveRecord::Migration[5.1]
  def change
    add_column :nutritions, :recipe_id, :integer
  end
end
