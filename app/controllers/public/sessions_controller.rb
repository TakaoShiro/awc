class Public::SessionsController < Devise::SessionsController
  
  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true) &&(@customer.active_for_authentication? == false)#退会機能
  #    sign_in @customer
      redirect_to new_customer_registration_path
    end
  end
  
  #protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :telephone_namber])
    #devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
  #end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
