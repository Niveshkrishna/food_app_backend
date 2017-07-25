class CreateNutritions < ActiveRecord::Migration[5.1]
  def change
    create_table :nutritions do |t|
      t.string :kcal_per_serving

      t.timestamps
    end
  end
end
