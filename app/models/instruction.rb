class Instruction < ApplicationRecord
    belongs_to :recipe
    validates_presence_of :content
    validates_presence_of :serial_number
    validates_presence_of :recipe_id
end
