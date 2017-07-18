class Ingredient < ApplicationRecord
    belongs_to :recipe
    validates_presence_of :content
    validates_presence_of :recipe_id
   # validates_presence_of :quantity_type
    #    validates_presence_of :quantity
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    after_save :assign_image_url
    def assign_image_url
        if self.image.exists?
             prepped_url = "http://food-app-thenightsaredarkandfullofterrors.c9users.io"+image.url.to_s
            if prepped_url != self.image_url.to_s
                self.image_url = prepped_url
                puts self.image_url
                self.save
            end
        end
    end

end
