class Nutrition < ApplicationRecord
=begin convention: Each row contains the quantities per gram of cooked recipe.
    -> per gram only to be entered
    -> any and all quantities to be entered in grams and not milligrams
=end
    belongs_to :recipe
end
