class Creator::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.creator_id = current_creator.id
    @message.save
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
