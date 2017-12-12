class AddPocketsRecipesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :pockets_recipes, id: false do |t|
      t.belongs_to :pocket, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
