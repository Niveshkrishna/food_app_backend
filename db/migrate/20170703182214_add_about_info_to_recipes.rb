class AddAboutInfoToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :about_info, :text
  end
end
