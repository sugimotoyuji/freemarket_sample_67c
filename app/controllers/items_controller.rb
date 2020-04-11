class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.item_images.new
  end
  
  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  private

  def item_params
    params.require(:item).permit(item_images_attributes: [:image])
  end

end
