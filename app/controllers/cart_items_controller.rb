class CartItemsController < ApplicationController
    
    def index
       @cart_items = CartItem.where(user_id: params[:user_id]) 
       if @cart_items != nil
           render :json => @cart_items
       else
           head :no_content
       end
    end
     def show
       @cart_item = CartItem.find_by(item_id: params[:id])#, user_id: params[:user_id]) 
       if @cart_item != nil
           render :json => @cart_item
       else
           head :no_content
       end
    end
 
    def create
        @cart_item = CartItem.new(user_id: params[:user_id],item_id: params[:id])
        image = ItemImage.find_by(item_id: params[:id])
        if image != nil
            @cart_item.image_url = "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{image.image.url}"
        end
         if @cart_item.save
                render :json => @cart_item
            else
                render :json => {:errors => @cart_item.errors.messages}, :status => 204
    
            end
    end
    
    def destroy
       @cart_item = CartItem.find_by(user_id: params[:user_id], item_id: params[:id]) 
       if @cart_item.destroy
            render :json => {deleted: true}, :status => 200
        else
            render :json => {deleted: false}, :status => 204
        end

    end
end
