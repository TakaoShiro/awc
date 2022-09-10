class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @animals = @customer.animals
    #DM機能の実装
    @currentcustomerentry=Entry.where(customer_id: current_customer.id)
    @customerentry=Entry.where(customer_id: @customer.id)
    #現在ログインしているユーザーではない
    unless @customer.id == current_customer.id
      @currentcustomerentry.each do |cu|
      @customerentry.each do |c|
        #すでにroomsが作成されている場合
        if cu.room_id == c.room_id then
          @isroom = true
          @roomid = cu.room_id
        end
      end
    end
    #roomが作成されていない場合
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
    end
    #@comments = @customer.animals.message #コメント数を表示させたい
  end

  def edit
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
    redirect_to customer_path(current_customer)
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
    redirect_to customer_path(current_customer)
    end
  end
  
  def unsubscribe
  end
  
  private

  def customers_params
    params.require(:customer).permit(:name, :kana, :prefecture, :telephone_namber, :email, :image)
  end
end
