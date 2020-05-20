class CreatePetApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_applications do |t|
      t.references :pet, foreign_key: true
      t.references :adoption_application, foreign_key: true
    end
  end
end
