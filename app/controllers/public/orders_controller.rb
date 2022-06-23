class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.shipping_zip_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.delivery_name = current_customer.first_name + current_customer.last_name
  end

  def confirmation
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:selected_address] == 1
      @address = Address.find(params[:order][:address_id])
      @order.shipping_zip_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.delivery_name = @address.name
    elsif params[:order][:selected_address] == 2
      @order = Order.new(order_params)
      @order.shipping_zip_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    end
    binding.pry
  end

  def completion
  end

  def index
  end

  def show
  end

private

  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_zip_code, :shipping_address, :delivery_name)
  end
end
