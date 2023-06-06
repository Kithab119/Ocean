class Creator::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_creator.id)
  end

  def check
    notification = Notification.find_by(id: params[:notification_id])
    if notification.present? && notification.action == "Item"
      if notitication.target_id == current_createtor.id
    # if notification.present? && notification.action == "Item"
    #   order_detail = OrderDetail.find_by(id: params[:order_detail_id])
    #   if order_detail.present? &&
    #     notification.order.order_details.ids.include?(order_detail.id) &&
    #     order_detail.item.creator_id == current_creator.id
        ## notification.order.order_details.find_by(id: order_detail.id)&.item&.creator_id == current_creator.id
        ## notification.order.order_details.find(order_detail.id).item.creator_id == current_creator.id
        @notification.update(checked: true)
      end
      redirect_to creator_order_path(@notification.order_id)
    end
  end

end
