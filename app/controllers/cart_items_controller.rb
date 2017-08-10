class CartItemsController < ApplicationController
    
    def index
       @items = CartItem.where(user_id: params[:user_id]) 
       @cart_items = []
       @items.all.each do |i|
           b = ItemImage.find_by(item_id: i.item_id)
           c = "http://www.foodgal.com/wp-content/uploads/2014/01/KQEDGettyImage.jpg"
           if b != nil
               c = "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{b.image.url}" if b.image.exists?
           end
           @cart_items << Item.find_by(id: i.item_id).attributes.merge(image: c) 
       end
       @cart_items = JSON(@cart_items)
       puts 
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
