require "rails_helper"

RSpec.describe ShelterReview do
  describe "relationships" do
    it {should belong_to :shelter}
  end
  describe "validations" do
    it { should validate_presence_of :title}
  end
end
