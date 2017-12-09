class Item < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cuisine
   # validates_presence_of :recipe_id
    has_one :recipe, dependent: :destroy
    has_many :item_images, dependent: :destroy
  #  validates :cuisine, inclusion: [:mexican, :indian, :french, :italian, :chinese]
    scope :with_images, -> {includes :item_images } 
    def self.search(search)
        where("name LIKE ? OR cuisine LIKE ?", "%#{search}%", "%#{search}%") 
    end
end
