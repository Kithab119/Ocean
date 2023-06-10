class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_details.present?
      @order.order_details.each do |order_detail|
        Notification.create(target_id: order_detail.item.creator.id, sender: "Creator", order_id: @order.id, action: "Payment")
      end
    else
      Notification.create(target_id: order_detail.item.creator.id, sender: "Creator", order_id: @order.id, action: "Payment")
    end
    redirect_to admin_order_path(@order.id)
  end


  private
    def order_params
      params.require(:order).permit(:is_receive)
    end

end
