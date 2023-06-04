class Creator::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(target_id: current_creator.id)
  end

end
