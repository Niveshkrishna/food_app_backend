class ItemImagesController < ApplicationController
    def index
        @item_image_images = ItemImage.where(item_id: params[:item_id]).to_a
        imagesArray = []
    
        if @item_image_images != nil
            @item_image_images.each do |x|
                imagesArray << "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{x.image.url}" if x.image.exists?
            end
            render :json => imagesArray                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        else
            head :no_content
        end
    end
    
    def show
        @item_image = ItemImage.find_by_id(params[:id])
        hash = {};
        if @item_image != nil
            hash[:url] = "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{@item_image.image.url}"
            render :json => hash
            #send_file @item_image.image.path
            #redirect_to @item_image.image.path
        else
            head :no_content
        end
    end
    
    def create
        @item_image = ItemImage.new(item_params)
        if @item_image.save
            render :json => @item_image
        else
            render :json => @item_image.errors.messages
        end
    end
    
    def update
        @item_image = ItemImage.find_by_id(params[:id])
         if @item_image != nil
            if @item_image.update(item_params)
                render :json => @item_image
            else
                render :json => @item_image.errors.messages
            end
        else
            head :no_content
        end
    end
    
    def destroy 
        @item_image = ItemImage.find_by_id(params[:id])
         if @item_image_image.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end
    end
    
    private
    
    def item_params
        params.permit(:image, :item_id)
    end
end
