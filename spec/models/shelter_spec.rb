require "rails_helper"

RSpec.describe Shelter do

  describe "relationships" do
    it {should have_many :pets}
    it {should have_many :shelter_reviews}
  end

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
  end

  describe "class_methods" do
    it "#applications" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")
      application_2 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm still awesome")

      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id)
      PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_1.id)
      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_2.id)
      PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_2.id)

      expect(shelter.applications).to eq(2)
    end

    it "#approved_applicants" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

      application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id, approval_status: "approved")

      expect(shelter.approved_applicants).to eq(1)
    end
  end

end
