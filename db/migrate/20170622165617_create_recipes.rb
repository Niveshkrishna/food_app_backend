class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :chef_name
      t.float :cook_time
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
