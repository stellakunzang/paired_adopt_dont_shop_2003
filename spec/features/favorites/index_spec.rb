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

    it "I can remove pets I've favorited from the list" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "https://img.thrfun.com/img/081/592/orange_tabby_x2.jpg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"
      click_button("Add to Favorites")

      visit "/pets/#{pet_2.id}"
      click_button("Add to Favorites")

      visit "/favorites"

      within("#pets-#{pet_1.id}") do
        click_button("Remove from Favorites")
        expect(current_path).to eq("/favorites")
      end

      expect(page).to_not have_content(pet_1.name)
      expect(page).to have_content("Favorite Pets: 1")

      within("#pets-#{pet_2.id}") do
        click_button("Remove from Favorites")
        expect(current_path).to eq("/favorites")
      end

      expect(page).to_not have_content(pet_2.name)
      expect(page).to have_content("Favorite Pets: 0")
    end

    it "and I have not added a pet, I see a message" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "https://img.thrfun.com/img/081/592/orange_tabby_x2.jpg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/favorites"

      expect(page).to_not have_content(pet_1.name)
      expect(page).to_not have_content(pet_2.name)
      expect(page).to have_content("Favorite Pets: 0")
      expect(page).to have_content("You have not added any pets.")
    end

    it "and I have favorite pets, I can delete all pets at the same time" do
      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "https://img.thrfun.com/img/081/592/orange_tabby_x2.jpg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      visit "/pets/#{pet_1.id}"
      click_button("Add to Favorites")

      visit "/pets/#{pet_2.id}"
      click_button("Add to Favorites")

      visit "/favorites"

      click_link("Remove All Pets")

      expect(page).to_not have_content(pet_1.name)
      expect(page).to_not have_content(pet_2.name)
      expect(page).to_not have_content("Remove All Pets")
      expect(page).to have_content("Favorite Pets: 0")
      expect(page).to have_content("You have removed ALL pets.")
    end
  end

  it "can link to adoption application" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "https://i.pinimg.com/originals/d2/b8/a5/d2b8a59f451f3f13300fb33d5eff5e12.jpg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "https://img.thrfun.com/img/081/592/orange_tabby_x2.jpg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/pets/#{pet_2.id}"
    click_button("Add to Favorites")

    visit "/favorites"

    click_link "Apply to Adopt"

    expect(current_path).to eq("/adoption_applications/new")
  end

  it "can display flash message and update favorites once application is submitted" do

    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/pets/#{pet_2.id}"
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

    expect(current_path).to eq("/favorites")
    expect(page).to have_content("Your application has been submitted!")
    expect(page).to have_no_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
  end

  it "can display all pets with an application submitted" do
    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
    pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

    visit "/pets/#{pet_1.id}"
    click_button("Add to Favorites")

    visit "/pets/#{pet_2.id}"
    click_button("Add to Favorites")

    application = AdoptionApplication.create(name: "Stella", address: "street", city: "City", state: "ST", zip: "34567", phone_number: "545-567-7643", description: "I'm awesome")

    PetApplication.create(pet_id: pet_1.id, adoption_application_id: application.id)

    visit "/favorites"

    expect(page).to have_content(pet_2.name)

    within ".existing_applications" do
      expect(page).to have_content(pet_1.name)
      expect(page).to have_no_content(pet_2.name)
    end

    click_link "Kunga"
    expect(current_path).to eq("/pets/#{pet_1.id}")
  end
end
