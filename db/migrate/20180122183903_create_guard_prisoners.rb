class CreateGuardPrisoners < ActiveRecord::Migration[5.1]
  def change
    create_table :guard_prisoners do |t|
      t.references :guard, foreign_key: true
      t.references :prisoner, foreign_key: true

      t.timestamps
    end
  end
end
