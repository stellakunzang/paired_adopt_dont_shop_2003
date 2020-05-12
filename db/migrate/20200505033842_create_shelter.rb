class CreateShelter < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :city
      t.string :zip
    end
  end
end
