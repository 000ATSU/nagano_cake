class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
   before_action :ensure_current_customer, {only: [:edit, :update, :destroy]}

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path
  end

private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

  def ensure_current_customer
    if Customer.find(params[:id]) != current_customer
      redirect_to root_path
    end
  end

end
