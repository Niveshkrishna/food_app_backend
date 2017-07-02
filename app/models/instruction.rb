class Instruction < ApplicationRecord
    belongs_to :recipe
    validates_presence_of :content
    validates_presence_of :serial_number
    validates_presence_of :recipe_id
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    after_save :assign_image_url
    def assign_image_url
        if self.image.exists? && self.image.url.to_s != self.image_url.to_s
              self.image_url = "http://food-app-thenightsaredarkandfullofterrors.c9users.io"+self.image.url
              puts self.image_url
              self.save
        end
    end
end
