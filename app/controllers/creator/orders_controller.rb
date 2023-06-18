class Creator::OrdersController < ApplicationController

  before_action :authenticate_creator!

  def index
    @order_details = OrderDetail.where(item_id: current_creator.items.map(&:id))
    @makings = current_creator.makings
    @orders = Order.where(id: @order_details.map(&:order_id)).or(Order.where(id: @makings.map(&:order_id)))
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

end
