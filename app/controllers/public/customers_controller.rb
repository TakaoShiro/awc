class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:index, :show, :edit, :update, :destroy, :update, :unsubscribe, :withdraw]
  before_action :without_guest, only: [:show, :index]
  
  def index
    @customers = Customer.where(is_deleted: false)
    #ページネーション
    @customers = Customer.page(params[:page])
    if params[:word]
      @customers = Customer.looks(params[:search], params[:word])
    else
      @customers = Customer.where(is_deleted: false)
    end
  end

  def show
    @customer = Customer.find(params[:id])
    #いいね一覧機能の作成
    favorites= Favorite.where(customer_id: @customer.id).pluck(:animal_id)
    @favorite_animals = Animal.find(favorites)
    @animals = @customer.animals
    #ページネーション
    @favorite_animals = Animal.page(params[:page])
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
    else
      render :edit
    end
  end
  
  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end
  
  def withdraw
    @customer = Customer.find_by(email: params[:email])
    ## is_deletedカラムをtrueに変更することにより削除フラグを立てる
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in?
  end

  def customers_params
    params.require(:customer).permit(:name, :kana, :prefecture, :telephone_namber, :email, :image, :is_deleted)
  end
end
