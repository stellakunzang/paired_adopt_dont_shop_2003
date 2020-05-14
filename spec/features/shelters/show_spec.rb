require 'rails_helper'

RSpec.describe "shelter show page" do
  it "can see specific shelter details" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end

  it "can delete a shelter" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to have_no_content("Happy Puppies")
  end

  it "can display link to shelter's pets page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link "View Pets"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  end

  it "can see a list of reviews for that shelter" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    review_2 = ShelterReview.create!(title: "Puppy Time!", rating: "4", content: "Happy place, but could be cleaner.", shelter_id: shelter_1.id)
    visit "/shelters/#{shelter_1.id}"

    within ".review-#{review_1.id}" do
      expect(page).to have_content(review_1.title)
      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(review_1.content)
      expect(page).to have_css("img[src*='image.jpeg']")
    end

    within ".review-#{review_2.id}" do
      expect(page).to have_content(review_2.title)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content(review_2.content)
      expect(page).to_not have_css("img[src*='image.jpeg']")
    end
  end

  it "can navigate to page to create new review" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link "Add Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/new")
  end

  it "can navigate to page to edit each shelter review" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}"

    within ".review-#{review_1.id}" do
      click_link "Edit Review"
    end

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/#{review_1.id}/edit")
  end

  it "can delete reviews" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    review_1 = ShelterReview.create!(title: "What a great place!", rating: "5", content: "We got our new puppy from Happy Puppies and they totally lived up to their name.", image: "image.jpeg", shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}"

    within ".review-#{review_1.id}" do
      click_link "Delete Review"
    end

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_no_content("What a great place!")
    expect(page).to have_no_content("We got our new puppy from Happy Puppies and they totally lived up to their name.")
  end
end
