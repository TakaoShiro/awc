class Admin::HomesController < ApplicationController
  
  def top
    @customers = Customer.all
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :kana, :prefecture, :telephone_namber, :email, :image, :is_deleted)
  end
end
