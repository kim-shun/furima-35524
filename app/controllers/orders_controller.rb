class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @order = Order.new
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    move_to_index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render "orders/index"
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    if current_user.id == @item.user.id && @item.order.present?
      redirect_to root_path
    end
    if current_user.id == @item.user.id && @item.order.nil?
      redirect_to root_path
    end
    if current_user.id != @item.user.id && @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],   
        currency: 'jpy'               
      )
  end
end
