class RecipeStatusesController < ApplicationController
    def get_status_by_ids
        status = RecipeStatus.find_by(user_id: params[:user_id], recipe_id: params[:recipe_id])
        if status != nil
            render json: status
        else
            head :no_content
        end
        
    end
    
    def save_status_by_ids
        status = RecipeStatus.find_by(params[:user_id], params[:recipe_id])
        if status == nil
            status = RecipeStatus.new(status_params)
            render json: status if status.save
        else
            status.ingredient_statuses = params[:ingredient_statuses] if params[:ingredient_statuses] != nil
            status.instruction_statuses = params[:instruction_statuses] if params[:instruction_statuses] != nil
            status.save
            render json: status
        end
    end
    
    private
    def status_params
    end
end
