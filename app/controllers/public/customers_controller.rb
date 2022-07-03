class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_current_customer, {only: [:edit, :update, :confirmation, :withdraw]}

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to public_customer_path(current_customer.id)
  end

  def confirmation
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number,)
  end

  def ensure_current_customer
    if Customer.find(params[:id]) != current_user
      redirect_to root_path
    end
  end

end
