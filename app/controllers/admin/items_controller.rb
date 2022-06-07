class Admin::ItemsController < ApplicationController
    def new
      @item = Item.new
    end
    
    # def create
    #   @item = Item.new
    # end
  
    def index
    end
  
    def show
    end
  
    def edit
    end
  
  private
    
    # def item_params
    #   params.require(:item).permit()
    # end
end
