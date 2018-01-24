class IncidentParticipant < ApplicationRecord
  belongs_to :incident_report
  belongs_to :prisoner
end
