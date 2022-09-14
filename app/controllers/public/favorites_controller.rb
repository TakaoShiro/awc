class Public::FavoritesController < ApplicationController
  before_action :ensure_correct_customer, only: [:create, :destroy]
  
  def create
    @amimal_favorite = Favorite.new(customer_id: current_customer.id, animal_id: params[:animal_id])
    @amimal_favorite.save
    @animal = Animal.find(params[:animal_id])
    #非同期通信の為redirect無し
  end
  
  def destroy
    @animal_favorite = Favorite.find_by(customer_id: current_customer.id, animal_id: params[:animal_id])
    @animal_favorite.destroy
    @animal = Animal.find(params[:animal_id])
    #非同期通信の為redirect無し
  end
end
