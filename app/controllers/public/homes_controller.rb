class Public::HomesController < ApplicationController
  before_action :ensure_correct_customer, except: [:top, :about]
  
  def top
    #新着順
    @animals = Animal.order('id DESC').limit(4)
  end
  
  
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com', name: "ゲスト", kana:"ゲスト", prefecture:"ゲスト", telephone_namber:"00000000000") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def about
  end
  
  private
  
  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in?
  end
  
end
