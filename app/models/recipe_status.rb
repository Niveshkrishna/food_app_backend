class RecipeStatus < ApplicationRecord
    serialize :ingredient_statuses, Array
    serialize :instruction_statuses, Array
    validates_uniqueness_of :user_id, scope: :recipe_id
    belongs_to :user
end
