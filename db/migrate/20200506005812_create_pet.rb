class CreatePet < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.string :approximate_age
      t.string :sex
      t.string :name_of_shelter
    end
  end
end
