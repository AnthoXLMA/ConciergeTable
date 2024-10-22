class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.string :city

      t.timestamps
    end
  end
end
