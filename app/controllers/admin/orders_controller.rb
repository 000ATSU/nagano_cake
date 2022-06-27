class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # binding.pry
  end
end
