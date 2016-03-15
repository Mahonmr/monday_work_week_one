class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.integer :species_id
      t.integer :latitude
      t.integer :longitude
      t.date :date_sighting

      t.timestamps null: false
    end
  end
end
