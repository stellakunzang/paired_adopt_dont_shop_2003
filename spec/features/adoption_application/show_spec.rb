require "rails_helper"

RSpec.describe "applications show page" do
  it "can display the application information including pets applied for" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)

    visit "/adoption_applications/#{application.id}"

    expect(page).to have_content(application.name)
    expect(page).to have_content(application.address)
    expect(page).to have_content(application.city)
    expect(page).to have_content(application.state)
    expect(page).to have_content(application.zip)
    expect(page).to have_content(application.phone_number)
    expect(page).to have_content(pet_1.name)

    click_link "#{pet_1.name}"

    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "can link to approve application" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)
    PetApplication.create(pet_id: pet_2.id, adoption_application_id: application.id)

    visit "/adoption_applications/#{application.id}"

    within ".pets-#{pet_1.id}" do
      click_link "Approve Application"
    end

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("adoption pending")
    expect(page).to have_content("This pet is on hold for Stella.")
  end
end
