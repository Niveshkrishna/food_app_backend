class PocketsController < ApplicationController
    def create
        pocket = find_pocket_by_user_id(pocket_params[:user_id])
        if !pocket
            pocket = create_new_pocket(pocket_params[:user_id])            
        end
        render json: pocket
    end
    
    def get_pocket_recipes
        pocket = find_pocket_by_user_id(pocket_params[:user_id])
        if !pocket
            self.create
        else
            pocket_json = pocket.as_json
            pocket_json[:recipes] = pocket.recipes
            render json: pocket_json
        end
    end
    
    def add_to_pocket
        pocket = find_by_id(pocket_params[:pocket_id])
        if !pocket
            pocket = create_new_pocket(pocket_params[:user_id])
        end
        pocket.recipes << Recipe.find(pocket_params[:recipe_id])
        pocket.save
        render json: pocket
    end
    
    def remove_from_pocket
        pocket = find_by_id(pocket_params[:pocket_id])
        recipe = Recipe.find(pocket_params[:recipe_id])
        pocket.recipes.delete(recipe)
        pocket.save
    end
    
    def clear_pocket
        pocket = find_by_id(pocket_params[:pocket_id])
        pocket.recipes.clear
        pocket.save
    end
    
    private
    
    def create_new_pocket(user_id)
        pocket = Pocket.create(user_id)
        pocket
    end
    
    def find_pocket_by_user_id(user_id)
        Pocket.find_by(user_id: pocket_params[:user_id])
    end
    
    def find_by_id(pocket_id)
        Pocket.find(pocket_id)
    end
    
    def pocket_params
        params.permit(:user_id, :pocket_id, :recipe_id)
    end
end
