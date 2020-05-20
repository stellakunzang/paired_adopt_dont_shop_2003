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
    new_pet = Pet.new(pet_params)
    if new_pet.save
      redirect_to "/shelters/#{params[:shelter_id]}/pets"
    else
      flash[:notice] = "All fields must be completed in order to add a new pet."
      redirect_to("/shelters/#{params[:shelter_id]}/pets/new")
    end
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
    favorite.contents.delete(params[:id])
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
