class AdoptionApplicationController < ApplicationController
  def new
    # need access to all of the favorites
    # need to get a list of the names of the favorites to use for the select_tag
  end

  def create
    new_application = AdoptionApplication.create(application_params)
    # :pets will be the Pet objects that are selected during the application
    # will I be able to do this directly or will have to use the name to grab the pet objects and then associate them with :pet 
    redirect_to "/favorites"
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end

end
