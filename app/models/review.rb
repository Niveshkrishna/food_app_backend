class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    validates_uniqueness_of :user_id, scope: :recipe_id
    validates_presence_of :user_id
    validates_presence_of :recipe_id
    validates :rating, inclusion: [1,2,3,4,5]   
end
