class RemoveKcalPerServingFromNutrition < ActiveRecord::Migration[5.1]
  def change
    remove_column :nutritions, :kcal_per_serving
  end
end
