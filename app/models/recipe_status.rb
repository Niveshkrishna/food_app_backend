class RecipeStatus < ApplicationRecord
    serialize :ingredient_statuses, Hash
    serialize :instruction_statuses, Hash
    validates_uniqueness_of :user_id, scope: :recipe_id
    belongs_to :user
end
