class Admin::ItemsController < ApplicationController

    def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item.id)
    end

    def index
    end

    def show
    end

    def edit
    end

  private

    def item_params
      params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
    end
end