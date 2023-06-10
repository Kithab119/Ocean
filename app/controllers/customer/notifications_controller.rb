class Customer::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_customer.id, sender: "Customer")
  end

  def check
    notification = Notification.find_by(id: params[:notification_id])
    if notification.present? && notification.target_id == current_customer.id
      if notification.action == "Room"
        notification.update(checked: true)
        redirect_to room_path(notification.room.id)

      elsif notification.action == "Send"
        notification.update(checked: true)
        redirect_to order_path(notification.order.id)
      end
    end

  end

end
