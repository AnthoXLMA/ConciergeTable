class AddReferenceToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :restaurant, null: false, foreign_key: true
  end
end
