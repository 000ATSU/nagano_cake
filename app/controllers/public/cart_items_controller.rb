class Public::CartItemsController < ApplicationController
  def index
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.items_id = current_item.id
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
