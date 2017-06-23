class ItemsController < ApplicationController

    def index
        @items = Item.all
        if @items != nil
            render :json => @items
        else
            head :no_content
        end
    end
    
    def show
        @item = Item.find_by_id(params[:id])
        if @item != nil
            render :json => @item 
        else
            head :no_content
        end
            
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            render :json => @item
        else
            render :json => @item.errors.messages
        end
    end
    
    def update
        @item = Item.find_by_id(params[:id])
         if @item != nil
            if @item.update(item_params)
                render :json => @item
            else
                render :json => @item.errors.messages
            end
        else
            head :no_content
        end
    end
    
    def destroy 
        @item = Item.find_by_id(params[:id])
         if @item.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end
    end
    private
    
    def item_params
        params.permit(:name, :cuisine)
    end
end

  