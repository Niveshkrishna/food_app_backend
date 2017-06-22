class Recipe < ApplicationRecord
  belongs_to :item
  has_many :instructions, dependent: :destroy
  has_many :ingredients,  dependent: :destroy
end
