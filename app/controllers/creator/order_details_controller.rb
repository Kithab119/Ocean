class Creator::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to creator_order_path(@order_detail.order.id)
  end


  private
    def order_detail_params
      params.require(:order_detail).permit(:is_sent)
    end

end
