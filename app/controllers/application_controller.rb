class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin then
    admin_root_path
    when Customer then
    root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin then
    new_admin_session_path
    when :customer then
    root_path
    end
  end
  
  def without_guest
    customer = Customer.regular_customers.find_by(email: current_customer&.email)
    redirect_to root_url if !customer
  end
  
end
