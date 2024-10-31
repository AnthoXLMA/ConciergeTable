class CreateTaxiBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :taxi_bookings do |t|
      t.date :pickup_date
      t.string :pickup_place
      t.string :dropoff_place

      t.timestamps
    end
  end
end
