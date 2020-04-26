class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end


  def new
    @items = Item.all
    @item = Item.new
    @item.item_images.new
    @item.build_brand
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end
  

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def buy
    @item = Item.find(params[:id])
  end

  
  
  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
  end

  def pay
    Payjp.api_key = 'sk_test_e74ef4bbca2d501919314c45'
    Payjp::Charge.create(
      #amountは値段を記載
      amount: 3500, 
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  def done
  end
  
end


  private
  def item_params
   params.require(:item).permit(:name,:description,:price,:brand,:size_id,:condition_id,:delivery_charge_id,:delivery_way_id,:delivery_date_id	, :category_id, item_images_attributes: [:image,:id,:_destroy],brand_attributes: [:id, :name]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
    @images = @item.images
  end
end