class RecipesController < ApplicationController
   # index not needed I guess, wait yes we need it
   def index
       @recipes = Recipe.where(item_id: params[:item_id]).to_a
       render :json => @recipes 
   end
   
   def create
     @recipe = Recipe.create!(recipe_params)
     render :json => @recipe
   end
   
   def show
    @recipe = Recipe.find(params[:id])
    render :json => @recipe
   end
   
   def update
       @recipe = Recipe.find(params[:id])
       @recipe.update(recipe_params)
       render :json => @recipe
   end
   
   def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        head :no_content
   end
   
   private
   
   def recipe_params
        params.permit(:item_id, :id, :cook_time, :name, :chef_name) 
   end
    
end
