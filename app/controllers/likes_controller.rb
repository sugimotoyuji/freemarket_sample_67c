class LikesController < ApplicationController
  before_action :set_item
  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    
    @likes = current_user.likes
    @items = Item.all
    @item.reload
    
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    like.destroy
    @likes = Like.where(item_id: params[:item_id])
    @items = Item.all
    @item.reload

  end

  def show
    @likes = Like.where(user_id: params[:user_id])
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end