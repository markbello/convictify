class AddPrisonerIdToIncidentParticipants < ActiveRecord::Migration[5.1]
  def change
    add_reference :incident_participants, :prisoner, foreign_key: true
  end
end
