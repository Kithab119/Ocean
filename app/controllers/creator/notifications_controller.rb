class Creator::NotificationsController < ApplicationController

  before_action :authenticate_creator!

  def index
    @notifications = Notification.where(target_id: current_creator.id, sender: "Creator")
  end

  def check
    notification = Notification.find_by(id: params[:notification_id])
    if notification.present? && notification.target_id == current_creator.id
      if notification.action == "Room"
        notification.update(checked: true)
        redirect_to creator_room_path(notification.room.id)

      elsif notification.action == "Request"
        notification.update(checked: true)
        redirect_to creator_making_path(notification.making.id)

      elsif notification.action == "Making"
        notification.update(checked: true)
        redirect_to creator_order_path(notification.order.id)

      elsif notification.action == "Item"
        notification.update(checked: true)
        redirect_to creator_order_path(notification.order.id)

      elsif notification.action == "Payment"
        notification.update(checked: true)
        redirect_to creator_order_path(notification.order.id)
      end
    end
  end

end