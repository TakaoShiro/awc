class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @animals = @customer.animals
    #@comments = @customer.animals.message #コメント数を表示させたい
  end

  def edit
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
    redirect_to customer_path(current_customer)
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
    redirect_to customer_path(current_customer)
  end
  end
  
  def unsubscribe
  end
  
  private

  def customers_params
    params.require(:customer).permit(:name, :kana, :prefecture, :telephone_namber, :email)
  end
end
