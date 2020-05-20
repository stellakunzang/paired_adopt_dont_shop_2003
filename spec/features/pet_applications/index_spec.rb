require 'rails_helper'

RSpec.describe "pet applications index page" do
  it "can link to the applications for a specific pet" do
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

  it "can display a message if there are no applications yet for this pet" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    visit "/pets/#{pet_1.id}"

    click_link "View All Applications for #{pet_1.name}"

    expect(current_path).to eq("/pets/#{pet_1.id}/applications")

    expect(page).to have_content("There are no applications for this pet yet. Add them to your favorites and apply now!")
  end
end
