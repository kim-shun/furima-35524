class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create, :show]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path 
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
