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
    @order.postage = "800"
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    if params[:order][:selected_address] == "0"
      @order = Order.new(order_params)
      @order.shipping_zip_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:selected_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_zip_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.delivery_name = @address.name
    end
  end

  def create
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
    params.require(:order).permit(:method_of_payment, :shipping_zip_code, :shipping_address, :delivery_name, :postage, :payment_amount, :product_total, :customer_id )
  end
end
