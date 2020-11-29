class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @item=Item.includes(:user).order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
