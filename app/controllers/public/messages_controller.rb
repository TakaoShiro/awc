class Public::MessagesController < ApplicationController
  before_action :ensure_correct_customer, only: [:create]
  before_action :authenticate_customer!, only: [:create]

  def create
    room_id = params[:message][:room_id]
    if Entry.where(customer_id: current_customer.id, room_id: room_id).present?
      @message = Message.create(params.require(:message).permit(:customer_id, :direct_message, :room_id).merge(customer_id: current_customer.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(room_id)
  end
  
  def destroy
    direct_message = Message.find(params[:id])
    room_id = direct_message.room_id
    direct_message.destroy
    redirect_to room_path(room_id)
  end
  
  private
  
  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in?
  end
end
