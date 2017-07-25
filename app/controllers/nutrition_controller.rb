class NutritionController < ApplicationController
    def index
        nutrition = Nutrition.find_by(recipe_id: params[:recipe_id])
        if nutrition != nil
            render json: nutrition
        else
            head :no_content
        end
    end
    
    def create
    end
    
    def destroy
    end

    def update
    end
    
    
end
