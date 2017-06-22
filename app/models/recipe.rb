class Recipe < ApplicationRecord
  belongs_to :item
  validates_presence_of :name
  validates_presence_of :item_id
  has_many :instructions, dependent: :destroy
  has_many :ingredients,  dependent: :destroy
end
