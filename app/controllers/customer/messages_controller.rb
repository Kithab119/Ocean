class Customer::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    @message.save
    Notification.create(customer_id: current_customer.id, creator_id: @message.creator_id, room_id: @message.room.id)
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
