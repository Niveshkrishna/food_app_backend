class RecipeStatusesController < ApplicationController
    def get_ingredient_statuses_by_ids
        status = RecipeStatus.find_by(user_id: params[:user_id], recipe_id: params[:recipe_id])
        if status != nil
            render json: status.ingredient_statuses
        else
            head :no_content
        end
        
    end
    
    def get_instruction_statuses_by_ids
    
        status = RecipeStatus.find_by(id_params)
        if status != nil
            render json: status.instruction_statuses
        else
            head :no_content
        end
        
    end
    
    def get_shopping_bag_status_by_id
        status = RecipeStatus.find_by(id_params)
        if status != nil
            render json: status.shopping_bag_status
        else
            head :no_content
        end
    end
    
    def save_status_by_ids
        status = RecipeStatus.find_by(id_params)
        if status == nil
            #puts "These are params: #{status_params}"
            status = RecipeStatus.new(id_params)
            status.ingredient_statuses = status_params[:ingredient_statuses] if status_params[:ingredient_statuses] != nil
            status.instruction_statuses = status_params[:instruction_statuses] if status_params[:instruction_statuses] != nil
            # user_id: status_params[:user_id], recipe_id: status_params[:recipe_id], ingredient_statuses: status_params[:ingredient_statuses],instruction_statuses: params[:instruction_statuses]
            if status.save
                render json: status
            else 
                render json: status.errors
            end
        else
            #puts "These are params: #{status_params}"
            if status.update_attributes(status_params)
                render json: status
            else
                render json: status.errors
            end
        end
    end
    
    def get_status
        @recipe_status = RecipeStatus.find_by(id_params)
        if @recipe_status != nil
            render json: @recipe_status
        else 
            head :no_content
        end
    end
    
    def get_recipe_statuses
        user = User.find(user_id_param["user_id"])
        recipe_statuses = user.recipe_statuses
        render json: recipe_statuses
    end
    
    private
    
    def status_params
        params.permit(:recipe,:recipe_status,:review,:rating).to_h
    end
    
    def user_id_param
        params.permit(:user_id).to_h
    end
    def id_params
        
        params.permit(:user_id, :recipe_id).to_h
    end
end
