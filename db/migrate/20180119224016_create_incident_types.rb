class CreateIncidentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :incident_types do |t|
      t.string :name
      t.integer :severity_rating

      t.timestamps
    end
  end
end
