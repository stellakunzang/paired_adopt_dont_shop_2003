require 'rails_helper'

RSpec.describe "shelter review edit page" do
  it "can edit shelter reviews" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "shelters/#{shelter_1.id}/reviews/#{review_1.id}/edit"

    expect(page).to have_content(review_1.title)
    expect(page).to have_content("Rating:")
    expect(page).to have_content("Content:")

    fill_in :title, with: "Cool dudes"

    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Cool dudes")
    expect(page).to have_no_content("What a great place!")
  end

  it "can send a flash message if fields on edit page are left empty" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}/reviews/#{review_1.id}/edit"

    fill_in :title, with: ""

    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/#{review_1.id}/edit")

    expect(page).to have_content("In order to edit a review, you must enter a title, rating, and description.")
  end
end
