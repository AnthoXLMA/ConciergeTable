class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :nom
      t.date :date_de_demande
      t.string :nom_du_client
      t.text :description
      t.date :date_d_echeance
      t.string :category

      t.timestamps
    end
  end
end
