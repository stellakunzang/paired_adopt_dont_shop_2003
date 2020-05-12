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

end
