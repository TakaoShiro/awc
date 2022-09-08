class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @animal = Animal.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
end
