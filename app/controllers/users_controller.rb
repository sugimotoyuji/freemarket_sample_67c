class UsersController < ApplicationController

  before_action :set_parents

  def show
    @user = User.find(params[:id])
  end

  def logout
  end
  
  def like
    @likes = Like.where(user_id: current_user.id)
    @item = @likes.map(&:item)
    @items = Item.all
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private
 
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
