class PetApplicationsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    @applicants = @pet.adoption_applications
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update({adoption_status: "adoption pending"})
    app_id = params[:application_id]
    application = AdoptionApplication.find(app_id)
    application.update({approval_status: toggle_approval_status(application)})
    redirect_to "/pets/#{pet.id}?application_id=#{app_id}"
  end

  def toggle_approval_status(application)
    if application.approval_status == "unapproved"
      "approved"
    else
      "unapproved"
    end
  end

end
