class PetApplicationsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    @applicants = @pet.adoption_applications
  end

  def update
    pet = Pet.find(params[:pet_id])
    app_id = params[:application_id]
    pet.update({adoption_status: "adoption pending"})
    redirect_to "/pets/#{pet.id}?application_id=#{app_id}"
  end
end
