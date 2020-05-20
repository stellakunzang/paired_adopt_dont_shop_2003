class Shelter < ApplicationRecord
  has_many :pets
  has_many :shelter_reviews, dependent: :destroy
  validates_presence_of :name, :address, :city, :state, :zip

  def average_review_rating
    if shelter_reviews == []
      return 0
    else
      rating_value = 0
      shelter_reviews.each do |review|
        rating_value += review.rating.to_i
      end
      (rating_value.to_f / shelter_reviews.count.to_f)
    end
  end
end
