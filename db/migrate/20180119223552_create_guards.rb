class CreateGuards < ActiveRecord::Migration[5.1]
  def change
    create_table :guards do |t|
      t.string :first_name
      t.string :last_name
      t.references :cell_block, foreign_key: true

      t.timestamps
    end
  end
end
