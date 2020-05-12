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
end
