class PetApplicationsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    @applicants = @pet.adoption_applications
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update({adoption_status: toggle_adoption_status(pet)})
    pet_application = PetApplication.where(adoption_application_id: params[:application_id], pet_id: pet.id).first
    pet_application.update({approval_status: toggle_approval_status(pet_application)})
    redirect_approval_status(pet_application)
  end

  def redirect_approval_status(pet_application)
    if pet_application[:approval_status] == "approved"
      redirect_to "/pets/#{pet_application.pet_id}?application_id=#{pet_application[:adoption_application_id]}"
    else
      redirect_to "/adoption_applications/#{pet_application[:adoption_application_id]}"
    end
  end

end
