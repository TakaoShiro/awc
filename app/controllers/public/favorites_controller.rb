class Public::FavoritesController < ApplicationController
  
  def create
    @amimal_favorite = Favorite.new(customer_id: current_customer.id, animal_id: params[:animal_id])
    @amimal_favorite.save
    redirect_to animals_path(params[:animal_id]) 
  end
  
  def destroy
    @animal_favorite = Favorite.find_by(customer_id: current_customer.id, animal_id: params[:animal_id])
    @animal_favorite.destroy
    redirect_to animal_path(params[:animal_id]) 
  end
end
