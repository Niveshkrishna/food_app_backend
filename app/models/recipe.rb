class Recipe < ApplicationRecord
  belongs_to :item
  validates_presence_of :name
  validates_presence_of :item_id
  #has_one :item
  has_many :instructions, dependent: :destroy
  has_many :ingredients,  dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  after_save :assign_image_url
    def assign_image_url
        if self.image.exists? && self.image.url.to_s != self.image_url.to_s
              self.image_url = "http://food-app-thenightsaredarkandfullofterrors.c9users.io"+self.image.url
              puts self.image_url
              #self.skip_callback(:after, :save, :assign_image_url)
              self.save
        end
    end
end
