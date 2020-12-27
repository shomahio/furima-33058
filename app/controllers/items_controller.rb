class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
     binding.pry
     if @item.save
       redirect_to root_path
     else 
       render :new
     end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :prefecture_id, :charge_id, :shipping_place_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
