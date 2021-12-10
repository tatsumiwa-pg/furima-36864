class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      shipping_address = ShippingAddress.create(shipping_address_params)
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :token).merge(user_id: current_user[:id])
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: @order[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:items_price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
