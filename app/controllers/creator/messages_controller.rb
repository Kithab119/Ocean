class Creator::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.creator_id = current_creator.id
    @message.save
    Notification.create(customer_id: @message.customer_id, creator_id: current_creator.id, room_id: @message.room.id)
    redirect_to creator_room_path(@message.room.id)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to creator_room_path(@message.room.id)
  end


private
  def message_params
    params.require(:message).permit(:letter, :room_id, :customer_id)
  end

end
