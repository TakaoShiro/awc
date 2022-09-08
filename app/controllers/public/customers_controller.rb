class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @animals = @customer.animals
  end

  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
end
