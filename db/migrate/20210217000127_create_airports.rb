class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :iata
      t.string :icao
      t.string :region
      t.string :airport_name
      t.string :city
      t.decimal :lat
      t.decimal :lon

      #to ask about: why ``decimal''

      t.timestamps
    end
  end
end
