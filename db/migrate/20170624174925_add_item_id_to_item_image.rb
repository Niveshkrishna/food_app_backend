class AddItemIdToItemImage < ActiveRecord::Migration[5.1]
  def change
    add_column :item_images, :item_id, :integer
  end
end
