class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.shipping_zip_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.delivery_name = current_customer.first_name + current_customer.last_name
  end

  def confirmation
    @order = Order.new(order_params)
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
    params.require(:order).permit(:method_of_payment)
  end
end
