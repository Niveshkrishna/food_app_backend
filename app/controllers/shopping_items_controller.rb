class ShoppingItemsController < ApplicationController
    def index
        @items = ShoppingItem.where(user_id: params[:user_id])
        @shopping_items = []
        @items.all.each do |i|
            @shopping_items << Ingredient.find_by(id: i.ingredient_id).attributes.merge(status: i.status)   
        end
        if @shopping_items != []
            render :json => @shopping_items 
        else
            head :no_content
        end
    end
    
    def create
        @item = ShoppingItem.new(item_params)
        @item.status = true
        if @item.save
            render :json => @item
        else
            render :json => @item.errors.messages
        end    
    end
    
    def update
        @item = ShoppingItem.find_by(ingredient_id: params[:id], user_id: params[:user_id])
        @item.status = params[:status]
        if @item.save
            render :json => {updated: true}
        else
            render :json => {updated: false}
        end
            
    end
    
    def destroy
        @item = ShoppingItem.find_by(ingredient_id: params[:id], user_id: params[:user_id])
         if @item.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end
    end
    
    
   private
   
   def item_params
        params.permit(:id, :ingredient_id,:user_id,:status) 
   end
end
