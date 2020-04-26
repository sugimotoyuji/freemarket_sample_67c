class FrontController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
  end

end