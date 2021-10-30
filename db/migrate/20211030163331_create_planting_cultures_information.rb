class CreatePlantingCulturesInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :planting_culture_informations, id: :uuid do |t|
      t.string :name, index: { unique: true }
      t.integer :days_to_accurate_identification
      t.integer :days_to_senescence
      t.integer :days_to_full_vegetation
      t.integer :days_to_harvest_possibility

      t.timestamps

      # the index on name could be done with: 
      # t.index :name, unique: true
    end
  end
end
