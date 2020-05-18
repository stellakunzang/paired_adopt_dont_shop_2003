require 'rails_helper'

RSpec.describe "pet show page" do
  it "can delete a pet" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_link "Delete Pet"

    expect(current_path).to eq("/pets")
    expect(page).to have_no_content("Kunga")
    expect(page).to have_content("Honey Pie")
  end

  it "can show pet with particular id" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"
    expect(page).to have_css("img[src*='image.jpeg']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end

  it "can update adoption status" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"
    expect(page).to have_content("adoptable")

    click_link "Change to Adoption Pending"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("adoption pending")

    click_link "Change to Adoptable"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("adoptable")
  end
end
