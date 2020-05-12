require "rails_helper"

RSpec.describe "new shelter review page" do
  it "can create a new review using a form" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}/reviews/new"

    fill_in :title, with: "What a great place!"
    select "5", from: :rating
    fill_in :content, with: "This is a Review"
    fill_in :image, with: "image.jpeg"

    click_button "Submit Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("What a great place!")
    expect(page).to have_content("5")
    expect(page).to have_content("This is a Review")
    expect(page).to have_css("img[src*='image.jpeg']")
  end

  it "can create a new review using a form without picture" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}/reviews/new"

    fill_in :title, with: "What a great place!"
    select "4", from: :rating
    fill_in :content, with: "This is a Review"

    click_button "Submit Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("What a great place!")
    expect(page).to have_content("4")
    expect(page).to have_content("This is a Review")
  end
end
