class PetApplicationsController < ApplicationController
  def show
    @pet = Pet.find(params[:pet_id])
    @applicants = @pet.adoption_applications
  end
end
