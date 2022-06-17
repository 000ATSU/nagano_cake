class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(1)
  end

  def show
  end

  def edit
  end
end
