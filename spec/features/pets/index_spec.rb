require 'rails_helper'

RSpec.describe "pets index page" do
  it "can see each pet in the system" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets"

    expect(page).to have_css("img[src*='image.jpeg']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter.name)
  end

  it "can update pet from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets"
    click_link "Edit Pet Information"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "can delete pet from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter_1.id)

    visit "/pets"

    click_link "Delete Kunga"

    expect(current_path).to eq("/pets")
    expect(page).to have_no_content("Kunga")
    expect(page).to have_content("Honey Pie")
  end

  it "can click name of shelter to go to shelter's show page" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets"
    click_link "Happy Puppies"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end
end
