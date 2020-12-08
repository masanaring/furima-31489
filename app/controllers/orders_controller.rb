class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :sold_out, only: [:index]
  

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def new
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])

    @item_order = ItemOrder.new(order_params)

    if @item_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: params[:token],
        currency: 'jpy'
      )
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
    params.permit(:title, :image, :explanation, :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def order_params
    params.require(:item_order).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, token: params[:token], item_id: @item[:id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end


  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
