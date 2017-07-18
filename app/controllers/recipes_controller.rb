class RecipesController < ApplicationController
   require "base64"
   def index
       @recipe = Recipe.find_by(item_id: params[:item_id]) # first recipe only
       # @recipes = Recipe.where(item_id: params[:item_id]).to_a # multiple recipes -> future feature
       if @recipe != nil
            render :json =>  @recipe #, imageUrl: imageUrl(@recipe)}
        else
            head :no_content
        end 
   end
   
   def create
     @recipe = Recipe.new(recipe_params)
    #@recipe.image = Base64.decode64(params[:image])  
     @recipe.item_id = params[:item_id]
         @item = Item.find(@recipe.item_id)
     if @recipe.save
         @item.recipe_id = @recipe.id
         @item.save
            render :json => @recipe
        else
            head :no_content
        end
   end
   
   def show
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe != nil
        render :json =>  @recipe #, imageUrl: imageUrl(@recipe)}
    else
        head :no_content
    end
   end
   
   def update
       @recipe = Recipe.find_by_id(params[:id])
       if @recipe != nil
          if @recipe.update(recipe_params)
            render :json => @recipe
          else
              render :json => @recipe.errors.messages
          end
       else
          head :no_content
       end
   end
   
   def destroy
        @recipe = Recipe.find_by_id(params[:id])
        if @recipe.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end
   end
   def get_recipes_by_user_id
       @recipes = Recipe.where(chef_id: params[:user_id]).to_a
       if @recipes == nil
           head :no_content
       else 
           render :json => @recipes
       end
   end
   
   
   private
   
   def recipe_params
        #puts params.require(:recipe).permit!().to_h
        params.require(:recipe).permit!().to_h
   end
    
end
