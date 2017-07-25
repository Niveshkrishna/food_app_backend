class CartItem < ApplicationRecord
    belongs_to :user
    validates_uniqueness_of :user_id, scope: :item_id
    
    
end
