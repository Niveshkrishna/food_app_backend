class AddAttachmentImageToIngredients < ActiveRecord::Migration[5.0]
  def self.up
    change_table :ingredients do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :ingredients, :image
  end
end
