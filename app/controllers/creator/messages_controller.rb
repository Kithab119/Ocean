class Creator::MessagesController < ApplicationController

  before_action :authenticate_creator!

  def create
    @message = Message.new(message_params)
    @message.sender = Creator.name
    @message.save
    Notification.create(target_id: @message.customer.id, sender: "Customer", room_id: @message.room.id, action: "Room")
    redirect_to creator_room_path(@message.room.id)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to creator_room_path(@message.room.id)
  end


private
  def message_params
    params.require(:message).permit(:letter, :room_id)
  end

end
