class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def show
    @pet = Pet.find(params[:id])
    if !params[:application_id].nil?
      @applicant = AdoptionApplication.find(params[:application_id])
    end
  end

  def create
    Pet.create(pet_params)
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def adopt_update
    pet = Pet.find(params[:id])
    pet.update({adoption_status: toggle_adoption_status(pet)})
    redirect_to "/pets/#{pet.id}"
  end

  private
  
  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter_id)
  end

end
