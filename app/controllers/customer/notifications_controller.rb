class Customer::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_customer.id, sender: "Customer")
  end

  def check
    notification = Notification.find_by(id: params[:notification_id])
    if notification.present?
      if notification.target_id == current_customer.id
        notification.update(checked: true)
      end
    end
    redirect_to room_path(notification.room.id)
  end

end
