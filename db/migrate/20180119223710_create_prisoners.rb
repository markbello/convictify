class CreatePrisoners < ActiveRecord::Migration[5.1]
  def change
    create_table :prisoners do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :release_date
      t.string :conviction
      t.references :cell, foreign_key: true

      t.timestamps
    end
  end
end
