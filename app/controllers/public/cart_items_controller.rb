class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(params[:item_id]).present?
      @cart_item = CartItem.find_by(params[:item_id])
      @cart_item.amount += params[:amount].to_i
      binding.pry
      @cart_item.save
      redirect_to public_cart_items_path
    else
      @cart_item.customer_id = current_customer.id
    binding.pry
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to public_cart_items_path
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
