class Public::AnimalsController < ApplicationController
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(animal_params)
    @animal.customer_id = current_customer.id
    @animal.save
    redirect_to customer_path(current_customer)
  end
  
  def index
    @animals = Animal.all
  end

  def show
    @customer = Customer.find(params[:id])
    @animal = Animal.find(params[:id])
    @comments = @animal.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_customer.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end
  
  def edit
    @animal = Animal.find(params[:id])
    unless @animal.customer == current_customer
    redirect_to customer_path(current_customer)
    end
  end
  
  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
    redirect_to customer_path(current_customer)
    end
  end
  
   private

  def animal_params
    params.require(:animal).permit(:image,:animal_type,:gender,:introduction,:age,:prefecture)
  end
  
end
