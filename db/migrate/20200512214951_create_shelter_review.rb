class CreateShelterReview < ActiveRecord::Migration[5.1]
  def change
    create_table :shelter_reviews do |t|
      t.string :title
      t.string :rating
      t.string :content
      t.string :image
      t.timestamp 
    end
  end
end
