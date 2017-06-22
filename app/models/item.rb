class Item < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cuisine
end
