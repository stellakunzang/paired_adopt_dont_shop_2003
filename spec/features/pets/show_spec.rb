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

  it "can link to all applications for a particular pet" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    application_1 = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")
    application_2 = AdoptionApplication.create(name: "Stellar", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm still awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_1.id)
    PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_1.id)
    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application_2.id)
    PetApplication.create(pet_id: pet_2.id, adoption_application_id: application_2.id)

    visit "/pets/#{pet_1.id}"

    click_link "View All Applications for #{pet_1.name}"

    expect(current_path).to eq("/pets/#{pet_1.id}/applications")

    expect(page).to have_content(application_1.name)
    expect(page).to have_content(application_2.name)

    click_link "#{application_1.name}"
    expect(current_path).to eq("/adoption_applications/#{application_1.id}")

    visit "/pets/#{pet_1.id}/applications"

    click_link "#{application_2.name}"
    expect(current_path).to eq("/adoption_applications/#{application_2.id}")
  end
end
