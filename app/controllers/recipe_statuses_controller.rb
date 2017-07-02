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
            puts "These are params: #{status_params}"
            
            status = RecipeStatus.new(status_params)
            # user_id: status_params[:user_id], recipe_id: status_params[:recipe_id], ingredient_statuses: status_params[:ingredient_statuses],instruction_statuses: params[:instruction_statuses]
            if status.save
                render json: status
            else 
                render json: status.errors
            end
        else
                        puts "These are params: #{status_params}"

            if status.update_attributes(status_params)
                render json: status
            else
                render json: status.errors
            end
        end
    end
    
    private
    def status_params
        params.permit!.to_h[:recipe_status]
    end
end
