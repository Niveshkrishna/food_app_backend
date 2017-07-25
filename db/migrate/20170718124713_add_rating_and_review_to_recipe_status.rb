class AddRatingAndReviewToRecipeStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_statuses, :rating, :integer
    add_column :recipe_statuses, :review, :string
  end
end
