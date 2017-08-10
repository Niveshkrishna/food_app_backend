class AddUserIdToShoppingItem < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_items, :user_id, :integer
  end
end
