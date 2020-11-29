class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_params, only: [:show,:edit,:update,:move_to_index]
  before_action :move_to_index, only: :edit
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
