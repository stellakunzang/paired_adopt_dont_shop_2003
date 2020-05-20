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

  it "can approve application for multiple pets" do
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

    visit "/adoption_applications/#{application.id}"

    within ".pets-#{pet_2.id}" do
      click_link "Approve Application"
    end

    expect(current_path).to eq("/pets/#{pet_2.id}")
    expect(page).to have_content("adoption pending")
    expect(page).to have_content("This pet is on hold for Stella.")
  end

  it "approve application link can be removed once application for specific pet has been approved" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")
    application2 = AdoptionApplication.create(name: "Betsy", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome as well")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)
    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application2.id)

    visit "/adoption_applications/#{application.id}"

    within ".pets-#{pet_1.id}" do
      click_link "Approve Application"
    end

    visit "/adoption_applications/#{application2.id}"

    expect(page).to have_no_content("Approve Application")
  end

  it "can unapprove an adoption applicaton" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)

    visit "/adoption_applications/#{application.id}"

    within ".pets-#{pet_1.id}" do
      click_link "Approve Application"
    end

    visit "/adoption_applications/#{application.id}"

    expect(page).to have_content("Unapprove Application")
    expect(page).to have_no_content("Approve Application")
  end

  it "can update pet adoption status with unapprove button" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)

    visit "/adoption_applications/#{application.id}"
    click_link "Approve Application"

    visit "/adoption_applications/#{application.id}"
    click_link "Unapprove Application"

    expect(current_path).to eq("/adoption_applications/#{application.id}")
    expect(page).to have_content("Approve Application")

    visit "/pets/#{pet_1.id}"
    expect(page).to have_content("adoptable")
    expect(page).to have_no_content("adoption pending")
    expect(page).to have_no_content("This pet is on hold for Stella.")
  end
end
