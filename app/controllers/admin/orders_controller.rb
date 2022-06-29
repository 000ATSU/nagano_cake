class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

private

  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_zip_code, :shipping_address, :delivery_name, :postage, :payment_amount, :product_total, :customer_id, :order_status )
  end

end
