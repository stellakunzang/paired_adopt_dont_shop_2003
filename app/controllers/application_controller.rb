class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite

  def favorite
    @favorite ||= Favorite.new(session[:favorite])
  end

  def toggle_adoption_status(pet)
    if pet.adoption_status == "adoptable"
      "adoption pending"
    else
      "adoptable"
    end
  end

end
