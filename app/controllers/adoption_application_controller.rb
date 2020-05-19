class AdoptionApplicationController < ApplicationController
  def new
    @favorites = favorite.contents.keys
  end

  def create
    new_application = AdoptionApplication.new(application_params)
    if new_application.save
      PetApplication.create(pet_id: params[:pets], adoption_application_id: new_application.id)
      favorite.contents.delete(params[:pets])
      flash[:notice] = "Your application has been submitted!"
      redirect_to "/favorites"
    else
      flash[:notice] = "All fields must be completed in order to submit an application."
      redirect_to("/adoption_applications/new")
    end
  end

  def show
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end

end
