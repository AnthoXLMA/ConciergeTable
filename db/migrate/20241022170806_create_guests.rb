class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :last_name
      t.string :first_name
      t.date :date_d_arrivee

      t.timestamps
    end
  end
end
