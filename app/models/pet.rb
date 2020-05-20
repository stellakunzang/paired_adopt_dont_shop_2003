class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :image, :name, :approximate_age, :sex
  has_many :pet_applications
  has_many :adoption_applications, through: :pet_applications

  def adoption_status_text
    if adoption_status == "adoptable"
      "Adoption Pending"
    else
      "Adoptable"
    end
  end

  def approved_applicant
    pet_applications.find do |application|
      application.approval_status == "approved"
    end
  end

end
