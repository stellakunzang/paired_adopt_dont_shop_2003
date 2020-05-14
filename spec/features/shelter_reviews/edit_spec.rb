require 'rails_helper'

RSpec.describe "shelter review edit page" do
  it "can edit shelter reviews" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "/#{review_1.id}/edit"

    expect(page).to have_content("Title:")
    expect(page).to have_content("Rating:")
    expect(page).to have_content("Content:")
    # expect page to have review_1.title etc.
    #expect(page).to have_css()

    fill_in :title, with: "Cool dudes"

    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Cool dudes")
    expect(page).to have_no_content("What a great place!")
  end
end
