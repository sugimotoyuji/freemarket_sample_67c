class ItemsController < ApplicationController
  before_action :authenticate_user!,  except:[:index,:show]


  def index
    @items = Item.includes(:item_images).order('created_at DESC').page(params[:page]).per(5)
    @category = Item.includes(:item_images).where(category_id: "2").page(params[:page]).per(5)

  end
  def new
    @items = Item.all
    @item = Item.new
    @item.item_images.new
    @item.build_brand
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end


  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  def show
   @item = Item.find(params[:id])
  end

  def buy
    @item = Item.find(params[:id])
   
  end

  def pay
    if card.blank?
      flash[:notice] = "カードを登録して下さい"
      redirect_to controller: 'card', action: 'index' 
    else
    @item = Item.find(params[:id])
    card = current_user.card
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    @item.update(order_status_id: 4)
    redirect_to action: :done
    end
  end

  def done
  end

  def card
    card = Card.where(user_id: current_user.id)
  end

  private
  def item_params
   params.require(:item).permit(:name,:description,:price,:brand,:size_id,:condition_id,:delivery_charge_id,:delivery_way_id,:delivery_date_id	, :category_id, item_images_attributes: [:image,:id,:_destroy],brand_attributes: [:id, :name]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
