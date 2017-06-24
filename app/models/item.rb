class Item < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cuisine
    has_many :recipes, dependent: :destroy
    has_many :item_images, dependent: :destroy
end
