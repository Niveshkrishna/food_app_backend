class ItemsController < ApplicationController
require 'will_paginate/array'
    def index
        @items = Item.all
        @items = Item.paginate(page: params[:page] ,per_page: 10)
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
    
    def search_item()
        @items = Item.search(params[:term])

        if !@items.blank?
            @items = @items.paginate(page: params[:page] ,per_page: 10)
            render :json => @items
        elsif 
           @recipes = Recipe.search(params[:term])
           @items = []
            if !@recipes.blank?
                @recipes.all.each do |r|
                    @items += Item.where(id: r.item_id)
                end
                @items = @items.paginate(page: params[:page] ,per_page: 10)
                render :json => @items
            else
            head :no_content
        end
    end
end
    
    private
    def item_params
        params.permit(:name, :cuisine)
    end
    
end

  