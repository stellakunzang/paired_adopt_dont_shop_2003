class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    favorites = favorite.contents
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
    if favorite.contents.delete(params[:pet_id])
      flash[:notice] = "Pet has been removed from your favorites list"
    else
      favorite.contents.clear
      flash[:notice] = "You have removed ALL pets."
    end
    redirect_back fallback_location: current_cycle
  end
end
