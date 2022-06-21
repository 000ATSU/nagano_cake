class Public::AddressesController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
    
    # @addresses = Address.find(current_customer.id)
  end

  def edit
  end

private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
