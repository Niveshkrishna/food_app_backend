class ShoppingItem < ApplicationRecord
    belongs_to :user
    validates_presence_of :user_id
    validates_presence_of :ingredient_id
end
