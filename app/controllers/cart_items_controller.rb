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
        @cart_item = CartItem.new(user_id: params[:user_id],item_id: params[:item_id])
            if @cart_item.save
                render :json => @cart_item
            else
                render :json => @cart_item.errors.messages
            end
    end
    
    def destroy
       @cart_item = CartItem.find_by(user_id: params[:user_id], item_id: params[:id]) 
       if @cart_item.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end

    end
end
