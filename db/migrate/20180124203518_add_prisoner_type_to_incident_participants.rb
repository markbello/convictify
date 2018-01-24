class AddPrisonerTypeToIncidentParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :incident_participants, :prisoner_type, :integer
  end
end
