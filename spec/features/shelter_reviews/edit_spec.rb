require 'rails_helper'

RSpec.describe "shelter review edit page" do
  it "can edit shelter reviews" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "/#{review_1.id}/edit"

    expect(:title).to have_content(review_1.title)
    #add for rating, content, and image once I verify that this works

    fill_in :title, with: "Cool dudes"

    click_link "Update Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Cool dudes")
    expect(page).to have_no_content("What a great place!")
  end
end
