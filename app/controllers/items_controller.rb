class ItemsController < ApplicationController

  before_action :set_category,  only: [:new, :create]
  before_action :authenticate_user!,  except:[:index,:show]
  before_action :set_item, only: [:buy,:pay,:show,:destroy,:edit,:update]


  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.includes(:item_images).order('created_at DESC').page(params[:page]).per(5)
    @category = Item.includes(:item_images).where(category_id: "2").page(params[:page]).per(5)
    @parents = Category.where(ancestry: nil)

  end


  def new
    @items = Item.all
    @item = Item.new
    @images = @item.item_images.build
    @item.build_brand
  end
  
  def get_category_parents
    @parents  = Category.where(ancestry: nil)
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


  def buy
    @parents = Category.where(ancestry: nil)
  end


  def pay
    if card.blank?
      redirect_to controller: 'cards', action: 'new'
    else
    
    card = current_user.cards
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
  

  def show
    @parents = Category.where(ancestry: nil)
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    parent_category = grandchild_category.parent.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to("/")
  end
  
  def set_category
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end
  end

  private
  def item_params
   params.require(:item).permit(:name,:description,:price,:brand,:size_id,:condition_id,:delivery_charge_id,:delivery_way_id,:delivery_date_id, :category_id, item_images_attributes: [:image,:id,:_destroy],brand_attributes: [:id, :name]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
    
  end
end