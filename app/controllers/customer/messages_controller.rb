class Customer::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.sender = Customer.name
    @message.save
    Notification.create(target_id: @message.creator.id, sender: "Creator", room_id: @message.room.id, action: "Room")
    redirect_to room_path(@message.room.id)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to room_path(@message.room.id)
  end


private
  def message_params
    params.require(:message).permit(:letter, :room_id, :creator_id)
  end

end
