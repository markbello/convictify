class RemovePlaintiffAndDefendantFromIncidentParticipants < ActiveRecord::Migration[5.1]
  def change
    remove_column :incident_participants, :defendant_id
    remove_column :incident_participants, :plaintiff_id
  end
end
