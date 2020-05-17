require 'rails_helper'

RSpec.describe "Favorite Pets Index", type: :feature do
  describe "as a visitor when I visit my favorite pets index page" do
    it "I see information about the pets I've favorited whose names are links to their show page" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "https://img.thrfun.com/img/081/592/orange_tabby_x2.jpg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"
      click_button("Add to Favorites")

      visit "/pets/#{pet_2.id}"
      click_button("Add to Favorites")

      visit "/favorites"

      expect(page).to have_link("Kunga")
      expect(page).to have_css("img[src*='#{pet_1.image}']")
      expect(page).to have_link("Honey Pie")
      expect(page).to have_css("img[src*='#{pet_2.image}']")

      click_on("#{pet_1.name}")
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
  end
end