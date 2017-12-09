class ItemsController < ApplicationController
require 'will_paginate/array'
require 'json'
    def index
        @all_items = Item.all
        @all_items = Item.paginate(page: params[:page] ,per_page: 10)
        @items = []
        @all_items.each do |item|
            hash = item.as_json
            hash[:imageUrls] = []
            item.item_images.each do |img|
                hash[:imageUrls] << "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{img.image.url}"
            end
            @items << hash
        end
        if @items != nil
            render :json => @items
        else
            head :no_content
        end
    end
    
    def all_items
        @all_items = Item.all
        @items = []
        @all_items.each do |item|
            hash = item.as_json
            hash[:imageUrls] = []
            item.item_images.each do |img|
                hash[:imageUrls] << "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{img.image.url}"
            end
            @items << hash
        end
        render json: @items 
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
    
    def special_items_of_the_day
            array = []
            Item.all[0,5].each do |item|
                hash = {item: item}
                hash[:image_urls] = []
                item.item_images.each do |img|
                    hash[:image_urls] << imageUrl(img)
                end
                array << hash
            end
            render :json => array
        
=begin    
        cuisines = [:american, :continental, :chinese, :french, :indian, :lebanese, :mexican, :pakistani]
        special_object =  ($redis.get("special_items_of_the_day"))
        p "special object", special_object
        if special_object != nil
            special_object = JSON.parse(special_object)
            if Time.now - Time.parse(special_object["time"]) >= 86400
                special_object["special_items"] = []
                selected = cuisines.sample(5)
                selected.each do |cuisine|
                    item = Item.where(cuisine: cuisine).sample
                    hash = {item: item}
                    hash["image_urls"] = []
                    item.item_images.each do |img|
                        hash["image_urls"] << imageUrl(img)
                    end
                    special_object["special_items" ] << hash
                end
                special_object["time"] = Time.now
                $redis.set("special_items_of_the_day", special_object.to_json)
                render :json => special_object   
            else
                render :json => special_object
            end
        else
            special_object = {}
            special_object["special_items"] = []
            special_object["time"] = Time.now
            selected = cuisines.sample(5)
            selected.each do |cuisine|
                item = Item.where(cuisine: cuisine).sample
                    hash = {item: item}
                    hash["image_urls"] = []
                    item.item_images.each do |img|
                        hash["image_urls"] << imageUrl(img)
                    end
                    special_object["special_items" ] << hash
            end
            p special_object
            $redis.set("special_items_of_the_day", special_object.to_json)
            render :json => special_object
        end
=end

    end
    private
    def item_params
        params.permit(:name, :cuisine)
    end
    
end

  