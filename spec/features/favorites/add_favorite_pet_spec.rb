require 'rails_helper'

RSpec.describe "Add Favorite Pet" do
  describe "as a visitor when visiting a pet's show page" do
    it "I can add it to my favorites list" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"

      expect(page).to have_button("Add to Favorites")

      click_button("Add to Favorites")

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Pet has been added to your favorites list")
      expect(page).to have_content("Favorite Pets: 1")

      visit "/pets/#{pet_2.id}"

      click_button("Add to Favorites")

      expect(current_path).to eq("/pets/#{pet_2.id}")
      expect(page).to have_content("Pet has been added to your favorites list")
      expect(page).to have_content("Favorite Pets: 2")
    end

    it "I cannot add a pet more than once" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"

      click_button("Add to Favorites")

      expect(page).to have_content("Favorite Pets: 1")
      expect(page).to_not have_content("Add to Favorites")
      expect(page).to have_button("Remove from Favorites")

      click_button("Remove from Favorites")

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Pet has been removed from your favorites list")
      expect(page).to_not have_content("Add to Favorites")

      expect(page).to have_content("Favorite Pets: 0")
    end
  end
end
