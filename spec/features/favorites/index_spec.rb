require 'rails_helper'

RSpec.describe "Favorite Pets Index", type: :feature do
  describe "as a visitor when I visit my favorite pets index page" do
    it "I see information about the pets I've favorited whose names are links to their show page" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"
      click_button("Add to Favorites")

      visit "/pets/#{pet_2.id}"
      click_button("Add to Favorites")

      visit "/favorites"

      expect(page).to have_content("Favorite Pets: 2")
      expect(page).to have_link("Kunga")
      expect(page).to have_css("img[src*='#{pet_1.image}']")
      expect(page).to have_link("Honey Pie")
      expect(page).to have_css("img[src*='#{pet_2.image}']")

      click_on("#{pet_1.name}")
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
  end
end
