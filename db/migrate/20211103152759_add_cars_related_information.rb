class AddCarsRelatedInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :cars, id: :uuid do |t|
      t.string :name, index: { unique: true }
      t.string :model_number
      t.integer :year

      t.timestamps

      # the index on name could be done with:
      # t.index :name, unique: true
    end

    create_table :cars_sales, id: :uuid do |t|
      t.uuid :car_id
      t.decimal :total_sales
      t.uuid :country_id
      t.integer :year

      t.timestamps

      t.index :car_id
      t.index :country_id

      # the index on name could be done with:
      # t.index :name, unique: true
    end

    create_table :countries, id: :uuid do |t|
      t.string :name
      t.integer :population
    end
  end
end
