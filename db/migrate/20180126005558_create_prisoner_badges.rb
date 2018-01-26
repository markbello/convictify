class CreatePrisonerBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :prisoner_badges do |t|
      t.references :prisoner, foreign_key: true
      t.string :name
    end
  end
end
