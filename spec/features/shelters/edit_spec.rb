require 'rails_helper'

RSpec.describe "shelter edit page" do
  it "can update the shelter details" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St.", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in "name", with: "The Happy Puppies Shelter"
    click_button "Submit"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("The Happy Puppies Shelter")
  end

  it "will see a message indicating incorrectly updated fields" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St.", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link "Update Shelter"

    fill_in "name", with: ""

    click_button "Submit"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    expect(page).to have_content("Fields were incorrectly updated.")
  end
end


# User Story 29, Flash Messages for Shelter Create and Update
#
# As a visitor
# When I am updating or creating a new shelter
# If I try to submit the form with incomplete information
# I see a flash message indicating which field(s) I am missing
