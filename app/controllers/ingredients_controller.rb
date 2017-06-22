class IngredientsController < ApplicationController
   def index
      @ingredients = Ingredient.where(recipe_id: params[:recipe_id]).to_a
      render :json => @ingredients 
   end
   
   def create
     @ingredient = Ingredient.create!(ingredient_params)
     render :json => @ingredient
   end
   
   def show
    @ingredient = Ingredient.find(params[:id])
    render :json => @ingredient
   end
   
   def update
       @ingredient = Ingredient.find(params[:id])
       @ingredient.update(ingredient_params)
       render :json => @ingredient
   end
   
   def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        head :no_content
   end
   
   private
   
   def ingredient_params
        params.permit(:recipe_id, :id, :content) 
   end
end
