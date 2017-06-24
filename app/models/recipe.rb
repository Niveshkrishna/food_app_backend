class Recipe < ApplicationRecord
  belongs_to :item
  validates_presence_of :name
  validates_presence_of :item_id
  has_many :instructions, dependent: :destroy
  has_many :ingredients,  dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
