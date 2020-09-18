class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @UserCustomer = Customer.new
    redirect_to root_path if !@item.customer.nil? || current_user.id == @item.user_id
  end

  def create
    @UserCustomer = UserCustomer.new(customer_params)
    if @UserCustomer.valid?
      pay_item
      @UserCustomer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def customer_params
    params.permit(:token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: customer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
