class Creator::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_creator.id)
  end

  def check
    notification = Notification.find_by(id: params[:notification_id])
    if notification.present? && notitication.target_id == current_creator.id
      if notitication.action == "Room"
        notification.update(checked: true)
        redirect_to creator_room_path(notification.room.id)

      elsif notitication.action == "Request"
        notification.update(checked: true)
        redirect_to creator_making_path(notification.making.id)

      elsif notitication.action == "Making"
        notification.update(checked: true)
        redirect_to creator_order_path(notification.order.id)

      elsif notitication.action == "Item"
        notification.update(checked: true)
        redirect_to creator_order_path(notification.order.id)
      end
    end
  end

end