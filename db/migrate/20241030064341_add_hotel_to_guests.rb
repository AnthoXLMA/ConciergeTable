class AddHotelToGuests < ActiveRecord::Migration[7.1]
  def change
    add_reference :guests, :hotel, null: true, foreign_key: true
  end
end
