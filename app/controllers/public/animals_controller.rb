class Public::AnimalsController < ApplicationController
  
  before_action :without_guest, except: [:index]
  before_action :ensure_correct_customer, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(animal_params)
    @animal.customer_id = current_customer.id
    if @animal.save
      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end
  
  def index
    @animals = Animal.all
    #ページネーション
    @animals_page = @animals.page(params[:page])
    @animals = @animals.where(animal_type: params.dig(:search, :animal_type)) if params.dig(:search, :animal_type).present?
    @animals = @animals.where(gender: params.dig(:search, :animal_gender)) if params.dig(:search, :animal_gender).present?
    animal_params = params.dig(:search, :animal_age)
    if animal_params.present? && animal_params == "不明"
      age = params.dig(:search, :animal_age)
    elsif animal_params.present?
      age = eval("[*#{animal_params}]")
    else
      age = ""
    end
    @animals = @animals.where(age: age) if age.present?
    @animals = @animals.where(prefecture: params.dig(:search, :animal_prefectures)) if params.dig(:search, :animal_prefectures).present?
    
    @animal_types = AnimalType.all
    @animal_genders = AnimalGender.all
    @animal_ages = AnimalAge.all
    @animal_prefectures = AnimalPrefecture.all
  end

  def show
    @animal = Animal.find(params[:id])
    @customer = @animal.customer
    @comments = @animal.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_customer.comments.new if customer_signed_in?#投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
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
    else
      render :edit
    end
  end
  
  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to customer_path(animal.customer_id)
  end
  
  private

  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in? || admin_signed_in?
  end

  def animal_params
    params.require(:animal).permit(:image,:animal_type,:gender,:introduction,:age,:prefecture)
  end
  
end
