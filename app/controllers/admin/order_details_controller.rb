class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order.order_details.any? { |order_detail| order_detail.production_status == "in_production"}
      @order.update(order_status: "in_production")
    elsif @order.order_details.all? { |order_detail| order_detail.production_status == "product_complet"}
      @order.update(order_status: "preparing_ship")
    end
    redirect_to admin_order_path(@order)
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :price, :production_status, :order_id, :item_id )
  end
end
