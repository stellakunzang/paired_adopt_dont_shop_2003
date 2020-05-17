class AdoptionApplicationController < ApplicationController
  def new
  end

  def create
    AdoptionApplication.create(application_params)
    redirect_to "/favorites"
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end

end
