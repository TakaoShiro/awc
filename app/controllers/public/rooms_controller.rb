class Public::RoomsController < ApplicationController
  before_action :ensure_correct_customer, only: [:show, :create]
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    if Entry.where(customer_id: current_customer.id,room_id: @room.id).present?
      @messages = @room.messages
      @entries = @room.entries
      
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, customer_id: current_customer.id)
    @entry2 = Entry.create(params.require(:entry).permit(:customer_id, :room_id).merge(room_id: @room.id))
    redirect_to rooms_path
  end
  
  private
  
  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in?
  end
end
