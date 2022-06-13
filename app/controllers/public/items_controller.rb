class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(1)
  end

  def show
    @item = Item.find(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
  end

end
