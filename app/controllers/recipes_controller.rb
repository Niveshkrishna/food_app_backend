class RecipesController < ApplicationController
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
   
   private
   
   def recipe_params
        params.permit(:item_id, :id, :cook_time, :name, :chef_name, :image) 
   end
    
end
