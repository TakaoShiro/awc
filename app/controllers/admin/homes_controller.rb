class Admin::HomesController < ApplicationController
  
  def top
    @customers = Customer.all
  end
  
  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to admin_root_path
  end
  
  private

  def customers_params
    params.require(:customer).permit(:name, :kana, :prefecture, :telephone_namber, :email, :image, :is_deleted)
  end
end
