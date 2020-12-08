class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :sold_out, only: [:index]
  

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def new
    
  end

  def create
    @item = Item.find(params[:item_id])

    @item_order = ItemOrder.new(order_params)

    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
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
