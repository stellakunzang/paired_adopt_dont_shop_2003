require 'rails_helper'

RSpec.describe "shelter new page" do
  it "can create new shelter" do

    visit "/shelters"

    click_link "New Shelter"

    expect(current_path).to eq("/shelters/new")

    fill_in "name", with: "Happy Puppies"
    fill_in "address", with: "55 Street St."
    fill_in "city", with: "Danger Mountain"
    fill_in "state", with: "UT"
    fill_in "zip", with: "80304"

    click_button "Create Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to have_content("Happy Puppies")
    expect(page).to have_content("55 Street St.")
    expect(page).to have_content("Danger Mountain")
    expect(page).to have_content("UT")
    expect(page).to have_content("80304")
  end

  it "will see a message indicating incorrectly-filled fields" do
    visit "/shelters"

    click_link "New Shelter"

    fill_in "name", with: ""
    fill_in "address", with: "55 Street St."
    fill_in "city", with: ""
    fill_in "state", with: "UT"
    fill_in "zip", with: "80304"

    click_button "Create Shelter"

    expect(current_path).to eq("/shelters/new")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end



# User Story 29, Flash Messages for Shelter Create and Update
#
# As a visitor
# When I am updating or creating a new shelter
# If I try to submit the form with incomplete information
# I see a flash message indicating which field(s) I am missing
