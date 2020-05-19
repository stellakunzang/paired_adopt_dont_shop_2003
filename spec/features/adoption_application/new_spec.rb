require "rails_helper"

RSpec.describe "New Adoption Application" do
  
  it "can submit a complete application for one pet" do

    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/adoption_applications/new"

    find("input[type='checkbox'][value='#{pet_1.id}']").set(true)

    fill_in :name, with: "Stella"
    fill_in :address, with: "3300 Josephine St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80205"
    fill_in :phone_number, with: "757-489-4936"
    fill_in :description, with: "I love animals more than people."

    click_on "Submit Application"
  end

  it "can submit application for multiple pets" do

    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/pets/#{pet_2.id}"
    click_button("Add to Favorites")

    visit "/adoption_applications/new"

    find("input[type='checkbox'][value='#{pet_1.id}']").set(true)
    find("input[type='checkbox'][value='#{pet_2.id}']").set(true)

    fill_in :name, with: "Stella"
    fill_in :address, with: "3300 Josephine St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80205"
    fill_in :phone_number, with: "757-489-4936"
    fill_in :description, with: "I love animals more than people."

    click_on "Submit Application"
  end

  it "can display flash message if application fields are left blank" do

    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/adoption_applications/new"

    find("input[type='checkbox'][value='#{pet_1.id}']").set(true)

    fill_in :name, with: "Stella"
    fill_in :address, with: "3300 Josephine St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80205"
    fill_in :phone_number, with: ""
    fill_in :description, with: ""

    click_on "Submit Application"

    expect(current_path).to eq("/adoption_applications/new")
    expect(page).to have_content("All fields must be completed in order to submit an application.")
  end
end
