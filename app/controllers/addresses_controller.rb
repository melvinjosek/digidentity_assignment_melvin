class AddressesController < ApplicationController
  def index
    @addresses = current_account.addresses.all
  end

  def new
    @address = current_account.addresses.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to new_confirmation_path, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:account_id, :street, :house_number, :postcode)
  end
end
