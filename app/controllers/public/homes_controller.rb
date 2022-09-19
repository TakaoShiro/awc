class Public::HomesController < ApplicationController

  def top
    #新着順
    @animals = Animal.order('id DESC').limit(4)
  end
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com', name: "ゲスト", kana:"ゲスト", prefecture:"ゲスト", telephone_namber:"00000000000") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # customer.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， customer.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def about
  end
  
end