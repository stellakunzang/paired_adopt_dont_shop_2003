require 'rails_helper'

RSpec.describe 'Favorite Pets Indicator', type: :feature do
  it "I can see the number of favorite pets on the navigation bar" do
    visit '/shelters'

    expect(page).to have_content("Favorite Pets: 0")

    visit '/pets'

    expect(page).to have_content("Favorite Pets: 0")
  end

  it "clicking the favorite pets indicator redirects me to the favorite pets index page" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"

    click_button("Add to Favorites")

    click_link("Favorite Pets: 1")
  end
end
