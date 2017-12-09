class AddShoppingBagStatusesToRecipeStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_statuses, :shopping_bag_status, :text
  end
end
