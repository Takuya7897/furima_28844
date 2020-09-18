class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @customer = Customer.new
    redirect_to root_path if !@item.customer.nil? || current_user.id == @item.user_id
  end

  def create
    # binding.pry
    @customer = UserCustomer.new(customer_params)
    @item = Item.find(params[:item_id])
    if @customer.valid?
      pay_item
      @customer.save
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
      # amount: customer_params[:price],
      amount: @item.price,
      card: customer_params[:token],
      currency: 'jpy'
    )
  end
end
