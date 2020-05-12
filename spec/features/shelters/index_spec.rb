require 'rails_helper'

RSpec.describe "shelter index page" do
  it "can see each shelter name" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")
    shelter_2 = Shelter.create(name: "Cutie Kitties", address: "666 Avenue Ln.", city: "Dancing River", state: "LA", zip: "12345")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "can access delete from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    shelter_2 = Shelter.create(name: "Cutie Kitties", address: "666 Avenue Ln.", city: "Dancing River", state: "LA", zip: "12345")

    visit "/shelters"

    click_link "Delete #{shelter_1.name}"

    expect(current_path).to eq("/shelters")
    expect(page).to have_no_content("Happy Puppies")
    expect(page).to have_content("Cutie Kitties")
  end

  it "can access edit from index" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters"

    click_link "Edit #{shelter_1.name} Information"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end
end
