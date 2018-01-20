class CreateIncidentParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :incident_participants do |t|
      t.references :incident_report, foreign_key: true
      t.references :defendant, foreign_key: {to_table: :prisoners}
      t.references :plaintiff, foreign_key: {to_table: :prisoners}

      t.timestamps
    end
  end
end
