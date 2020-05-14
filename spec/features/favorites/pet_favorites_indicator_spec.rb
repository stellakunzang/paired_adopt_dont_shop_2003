require 'rails_helper'

RSpec.describe 'Favorite Pets Indicator', type: :feature do
  describe "as a visitor visiting any page in the application" do
    it "I can see the number of favorite pets on the navigation bar" do
      visit '/shelters'

      expect(page).to have_content("Favorite Pets: 0")

      visit '/pets'

      expect(page).to have_content("Favorite Pets: 0")
    end
  end
end
