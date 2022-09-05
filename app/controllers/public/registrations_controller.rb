class Public::RegistrationsController < Devise::RegistrationsController
  def new
    @customer = Customer.new
  end

  def create
  end
  
  def after_sign_in_path_for(resource)
    customer_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :kana, :telephone_namber, :prefecture])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
  end
end
