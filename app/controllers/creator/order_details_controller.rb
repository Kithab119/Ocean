class Creator::OrderDetailsController < ApplicationController

  before_action :authenticate_creator!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    Notification.create(target_id: @order_detail.order.customer.id, sender: "Customer", order_id: @order_detail.order.id, item_id: @order_detail.item.id, action: "Send")
    redirect_to creator_order_path(@order_detail.order.id)
  end


  private
    def order_detail_params
      params.require(:order_detail).permit(:is_sent)
    end

end
