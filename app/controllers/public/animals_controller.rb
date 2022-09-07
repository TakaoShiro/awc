class Public::AnimalsController < ApplicationController
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(animal_params)
    @animal.save
    redirect_to customer_path(current_customer)
  end
  
  def index
  end

  def show
  end
  
  def edit
  end
  
  def update
  end
  
   private

  def animal_params
    params.require(:animal).permit(:profile_image,:type,:gender,:introduction,:age,:prefecture)
  end
  
end
