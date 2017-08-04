class AddManyCategoriesToNutritions < ActiveRecord::Migration[5.1]
  def change
    add_column :nutritions, :protein, :integer
    add_column :nutritions, :total_fat, :integer
    add_column :nutritions, :saturated_fat, :integer
    add_column :nutritions, :trans_fat, :integer
    add_column :nutritions, :cholesterol, :integer
    add_column :nutritions, :sodium, :integer
    add_column :nutritions, :total_carb, :integer
    add_column :nutritions, :dietary_fiber, :integer
    add_column :nutritions, :sugars, :integer
    add_column :nutritions, :vitamin_a, :integer
    add_column :nutritions, :vitamin_c, :integer
    add_column :nutritions, :calcium, :integer
    add_column :nutritions, :iron, :integer
  end
end
