class ItemsController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show, :new, :create, :update]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else 
       render :new
     end
  end

  def show
  end

  def edit
  end

  
  def update
        redirect_to root_path
      else
        render :edit
      end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :prefecture_id, :charge_id, :shipping_place_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_prototype
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user == @item.user
  end
end
