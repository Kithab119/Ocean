class Customer::RoomsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @making = Making.find(params[:making_id])
    @room = Room.find_or_create_by(making: @making)
    notifications = Notification.where(room_id: @room.id, checked: false)
    if notifications.present?
      notifications.each { |notification| notification.update(checked: true) }
    end
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

end
