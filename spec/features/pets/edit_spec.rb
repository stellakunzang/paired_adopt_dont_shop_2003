require 'rails_helper'

RSpec.describe "pet edit page" do
  it "can update pet" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    expect(page).to have_content("Image")
    expect(page).to have_content("Description")
    expect(page).to have_content("Approximate Age")
    expect(page).to have_content("Sex")
    fill_in "name", with: "Kun Gyi Ngo Woah"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")

    expect(page).to have_content("Kun Gyi Ngo Woah")
    expect(page).to have_no_content("Kunga")
  end
end
