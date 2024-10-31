class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
