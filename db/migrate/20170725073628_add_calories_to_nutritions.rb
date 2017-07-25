class AddCaloriesToNutritions < ActiveRecord::Migration[5.1]
  def change
    add_column :nutritions, :calories, :integer
  end
end
