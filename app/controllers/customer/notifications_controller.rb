class Customer::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_customer.id)
  end

end
