class Ingredient < ApplicationRecord
    belongs_to :recipe
    validates_presence_of :content
    validates_presence_of :recipe_id
    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
