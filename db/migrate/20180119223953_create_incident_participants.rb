class CreateIncidentParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :incident_participants do |t|
      t.references :incident_report, foreign_key: true
      t.references :defendant, foreign_key: true
      t.references :plaintiff, foreign_key: true

      t.timestamps
    end
  end
end
