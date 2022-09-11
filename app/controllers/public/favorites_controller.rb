class Public::FavoritesController < ApplicationController
  
  def create
    @amimal_favorite = Favorite.new(customer_id: current_customer.id, animal_id: params[:animal_id])
    @amimal_favorite.save
    #非同期通信の為redirect無し
  end
  
  def destroy
    @animal_favorite = Favorite.find_by(customer_id: current_customer.id, animal_id: params[:animal_id])
    @animal_favorite.destroy
    #非同期通信の為redirect無し
  end
end
