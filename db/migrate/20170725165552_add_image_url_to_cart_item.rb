class AddImageUrlToCartItem < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :image_url, :string
  end
end
