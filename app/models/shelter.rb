class Shelter < ApplicationRecord
  has_many :pets
  has_many :shelter_reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def applications
    applications = []
    pets.each do |pet|
      applications << pet.adoption_applications
    end
    applications.flatten.uniq.count 
  end
end
