require "rails_helper"

RSpec.describe Pet do

  describe "relationships" do
    it { should belong_to :shelter}
    it { should have_many :pet_applications}
    it { should have_many(:adoption_applications).through(:pet_applications)}
  end

  describe "validations" do
    it { should validate_presence_of :image }
    it { should validate_presence_of :name}
    it { should validate_presence_of :approximate_age}
    it { should validate_presence_of :sex}
  end

  describe "methods" do

    it "#adoption_status_text" do
      shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

      expect(pet_1.adoption_status_text).to eq("Adoption Pending")
    end

    it "#approved_applicant" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

      application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

      PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id)

      expect(pet_1.approved_applicant).to eq(nil)
    end
  end

end
