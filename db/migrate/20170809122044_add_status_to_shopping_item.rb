class AddStatusToShoppingItem < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_items, :status, :boolean
  end
end
