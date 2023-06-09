class Creator::RoomsController < ApplicationController

  before_action :authenticate_creator!

  def create
    @making = Making.find(params[:making_id])
    @room = Room.find_or_create_by(making: @making)
    notifications = Notification.where(room_id: @room.id, checked: false)
    if notifications.present?
      notifications.each { |notification| notification.update(checked: true) }
    end
    redirect_to creator_room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

end
