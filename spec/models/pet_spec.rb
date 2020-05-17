require "rails_helper"

RSpec.describe Pet do

  describe "relationships" do
    it { should belong_to :shelter}
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
  end

end
