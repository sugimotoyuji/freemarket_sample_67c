class AddressController < ApplicationController

  def edit
    @address = Address.find(current_user.id)
  end

  def update
    @address = Address.find(current_user.id)
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

end
