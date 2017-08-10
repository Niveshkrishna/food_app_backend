class CreateShoppingItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_items do |t|
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
