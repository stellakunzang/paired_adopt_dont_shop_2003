require "rails_helper"

RSpec.describe AdoptionApplication do

  describe "relationships" do
    it {should have_many :pet_applications}
    it {should have_many(:pets).through(:pet_applications)}
  end

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
    it { should validate_presence_of :phone_number}
    it { should validate_presence_of :description}
  end

  describe "class methods" do
    it "#pets" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")
      application_2 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm still awesome")

      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id)
      PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_1.id)
      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_2.id)
      PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_2.id)

      expect(AdoptionApplication.pets).to eq([pet_1, pet_2])
    end

    it "#approval_status" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

      application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id)

      expect(application_1.approval_status(pet_1, application_1)).to eq("unapproved")
    end
  end


end
