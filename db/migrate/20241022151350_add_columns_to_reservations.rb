class AddColumnsToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :jour, :date
    add_column :reservations, :heure, :time
    add_column :reservations, :number_of_guests, :integer
  end
end
