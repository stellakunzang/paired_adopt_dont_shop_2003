require "rails_helper"

RSpec.describe "New Adoption Application" do
  it "can select pets from favorites to submit application to adopt" do

    shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)

    Favorite.new([pet_1])

    visit "/adoption_application/new"

    # select "Kunga", from: :pets

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

    Favorite.new([pet_1])

    visit "/adoption_application/new"

    # select "Kunga", from: :favorites

    fill_in :name, with: "Stella"
    fill_in :address, with: "3300 Josephine St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80205"
    fill_in :phone_number, with: ""
    fill_in :description, with: ""

    click_on "Submit Application"

    expect(current_path).to eq("/adoption_application/new")
    expect(page).to have_content("All fields must be completed in order to submit an application.")
  end

  describe "favorites index page" do
    xit "can display flash message and update favorites once application is submitted" do

      shelter = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
      pet_1 = Pet.create(image: "image.jpeg", name: "Kunga", approximate_age: "1", sex: "male", shelter_id: shelter.id)
      pet_2 = Pet.create(image: "image.jpeg", name: "Honey Pie", approximate_age: "11", sex: "female", shelter_id: shelter.id)

      Favorite.new([pet_1, pet_2])

      visit "/adoption_application/new"

      # select "Kunga", from: :favorites

      fill_in :name, with: "Stella"
      fill_in :address, with: "3300 Josephine St"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80205"
      fill_in :phone_number, with: "757-489-4936"
      fill_in :description, with: "I love animals more than people."

      click_on "Submit Application"

      except(current_path).to eq("/favorites")
      expect(page).to have_content("Your application has been submitted!")
      expect(page).to have_no_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
    end
  end

end
