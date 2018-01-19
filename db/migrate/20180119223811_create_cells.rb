class CreateCells < ActiveRecord::Migration[5.1]
  def change
    create_table :cells do |t|
      t.string :name
      t.references :cell_block, foreign_key: true

      t.timestamps
    end
  end
end
