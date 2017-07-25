class Nutrition < ApplicationRecord
    # Convention: kcal_per_serving -> {"x grams/y people" => "200"}
    # serialize :kcal_per_serving, Hash
    belongs_to :recipe
end
