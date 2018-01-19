class CreateCellBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :cell_blocks do |t|
      t.string :name
      t.integer :security_rating

      t.timestamps
    end
  end
end
