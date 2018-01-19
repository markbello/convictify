class IncidentParticipant < ApplicationRecord
  belongs_to :incident_report
  belongs_to :defendant, class_name: "Prisoner"
  belongs_to :plaintiff, class_name: "Prisoner"
end
