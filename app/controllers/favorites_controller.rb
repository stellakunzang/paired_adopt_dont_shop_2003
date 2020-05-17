class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    favorites = favorite.contents
  end

  def index
  end
  
  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.contents
    quantity = favorite.count_of(pet.id)
    flash[:notice] = "Pet has been added to your favorites list"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    favorite.contents.delete(params[:pet_id])
    flash[:notice] = "Pet has been removed from your favorites list"
    redirect_to "/pets/#{params[:pet_id]}"
  end
end
