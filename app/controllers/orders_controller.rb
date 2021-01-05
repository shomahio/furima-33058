class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  


  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_018d64c1ae354926f89237de" 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token], 
      currency: 'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.order != nil
  end

end
