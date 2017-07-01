class CreateRecipeStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_statuses do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :ingredient_statuses
      t.text :instruction_statuses

      t.timestamps
    end
  end
end
