class UsersController < ApplicationController
  before_action :set_parents

  def show
    @user = User.find(params[:id])
  end

  def logout
  end
  
  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end


end
