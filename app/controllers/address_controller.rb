class AddressController < ApplicationController
  before_action :set_address, only: [:edit,:update]

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  protected

  def address_params
    params.require(:address).permit(:shipping_first_name, :shipping_first_name_reading, :shipping_last_name, :shipping_last_name_reading, :zip_code, :prefecture, :city, :address, :building, :shipping_telephone)
  end

  def set_address
    @address = Address.find(current_user.id)
  end

end
