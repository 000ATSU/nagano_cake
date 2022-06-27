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
    @order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item_id
    @order_detail.quantity = cart_item.amount
    @order_detail.price = cart_item.item.price
    @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to completion_public_order_path(current_customer.id)
  end

  def completion
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

private

  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_zip_code, :shipping_address, :delivery_name, :postage, :payment_amount, :product_total, :customer_id, :order_status )
  end

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :price, :production_status, :order_id, :item_id)
  end

end
