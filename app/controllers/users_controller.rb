class UsersController < ApplicationController

  before_action :set_parents

  def show
    @user = User.find(params[:id])
  end

  def logout
  end
  
  def like
    @user = current_user
    @likes = Like.where(user_id: @user.id)
    @item = []
    @likes.each do |like|
      @item << Item.find(like.item_id)
    end
    @items = Item.all
  end
  
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private
 
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
