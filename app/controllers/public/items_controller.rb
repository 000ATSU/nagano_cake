class Public::ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.page(params[:page]).per(1)
  end

  def show
  end
end
