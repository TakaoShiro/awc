class Public::RegistrationsController < Devise::RegistrationsController
  def new
    @customer = Customer.new
  end

  def create
  end
  
  def after_sign_in_path_for(resource)
    "/"
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :kana, :email, :telephone_namber, :prefecture])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
  end
end
