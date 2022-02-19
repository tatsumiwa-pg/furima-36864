class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :building_name,
      :phone_number
    ).merge(
      token: params[:token],
      item_id: params[:item_id],
      user_id: current_user.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
    refuse_re_order
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.items_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def refuse_re_order
    order = @item.order
    redirect_to root_path and return if current_user.id == @item.user_id || !order.nil?
  end
end
