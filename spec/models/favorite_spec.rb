require "rails_helper"

RSpec.describe Favorite do
  describe "class methods" do
    it "#total_count" do
      shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter_1.id)
      favorites = Favorite.new([pet_1, pet_2])

      expect(favorites.total_count).to eq(2)
    end

    it "#add_pet" do
      shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter_1.id)
      pet_3 = Pet.create(image: "image.jpeg", name: "Oreo", approximate_age: "11", sex: "male", shelter_id: shelter_1.id)
      favorites = Favorite.new([pet_1, pet_2])

      favorites.add_pet(pet_3)

      expect(favorites.total_count).to eq(3)
      expect(favorites.contents).to eq([pet_1, pet_2, pet_3])
    end
  end
end
