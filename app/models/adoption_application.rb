class AdoptionApplication < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :description
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.pets
    pets = []
    AdoptionApplication.all.each do |app|
      app.pets.each do |pet|
        pets << pet
      end
    end
    pets.uniq
  end
end
