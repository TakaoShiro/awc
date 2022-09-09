class MessagesController < ApplicationController
  
  before_action :authenticate_customer!, only: [:create]

  def create
    if Entry.where(customer_id: current_customer.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :direct_message, :room_id).merge(customer_id: current_customer.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
　　redirect_to "/rooms/#{@message.room_id}"
  end
end
