class Ingredient < ApplicationRecord
    belongs_to :recipe
    validates_presence_of :content
    validates_presence_of :recipe_id
end
