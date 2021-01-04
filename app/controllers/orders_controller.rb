class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      # binding.pry
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
    # @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_018d64c1ae354926f89237de"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end



end
