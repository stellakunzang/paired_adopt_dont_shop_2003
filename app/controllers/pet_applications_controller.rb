class PetApplicationsController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @applicants = @pet.adoption_applications
  end
end
