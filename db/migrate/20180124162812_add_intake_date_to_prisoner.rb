class AddIntakeDateToPrisoner < ActiveRecord::Migration[5.1]
  def change
    add_column :prisoners, :intake_date, :datetime
  end
end
