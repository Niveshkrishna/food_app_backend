class Item < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cuisine
    validates_presence_of :recipe_id
    has_one :recipe, dependent: :destroy
    belongs_to :recipe
    has_many :item_images, dependent: :destroy
end
