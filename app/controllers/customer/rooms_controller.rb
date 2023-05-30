class Customer::RoomsController < ApplicationController

  def create
    @making = Making.find(params[:making_id])
    @room = Room.find_or_create_by(making: @making)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

end
