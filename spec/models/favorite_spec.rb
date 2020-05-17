require "rails_helper"

RSpec.describe Favorite do
  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      favorite = Favorite.new({
        '1' => 2,
        '2' => 3
        })

      expect(favorite.total_count).to eq(5)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do
      favorite = Favorite.new({
        '1' => 2,
        '2' => 3
        })

      favorite.add_pet(1)
      favorite.add_pet(2)

      expect(favorite.contents).to eq({'1' => 3, '2' => 4})

  describe "class methods" do
    it "#total_count" do
      shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter_1.id)
      favorites = Favorite.new([pet_1, pet_2])

      expect(favorites.total_count).to eq(2)
    end
  end

  describe "#count_of" do
    it "returns the count of all pets in the favorites list" do
      favorite = Favorite.new({})

      expect(favorite.count_of(5)).to eq(0)
    end
  end

  describe "#favorite_status" do
    it "tells you whehter a pet has favorite status or not" do
      favorite = Favorite.new({})

      favorite.add_pet(1)

      expect(favorite.favorite_status(1)).to eq(true)
    end
  end
end
