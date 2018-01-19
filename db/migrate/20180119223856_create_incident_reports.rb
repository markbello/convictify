class CreateIncidentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :incident_reports do |t|
      t.text :content
      t.references :incident_type, foreign_key: true
      t.references :guard, foreign_key: true

      t.timestamps
    end
  end
end
