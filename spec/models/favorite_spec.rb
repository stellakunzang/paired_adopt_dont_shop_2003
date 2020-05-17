require "rails_helper"

RSpec.describe Favorite do
  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      favorite = Favorite.new({
        '1' => 2,
        '2' => 3
        })

      expect(favorite.total_count).to eq(5)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do
      favorite = Favorite.new({
        '1' => 2,
        '2' => 3
        })

      favorite.add_pet(1)
      favorite.add_pet(2)

      expect(favorite.contents).to eq({'1' => 3, '2' => 4})
    end
  end

  describe "#count_of" do
    it "returns the count of all pets in the favorites list" do
      favorite = Favorite.new({})

      expect(favorite.count_of(5)).to eq(0)
    end
  end

  describe "#favorite_status" do
    it "tells you whehter a pet has favorite status or not" do
      favorite = Favorite.new({})

      favorite.add_pet(1)

      expect(favorite.favorite_status(1)).to eq(true)
    end
  end
end
