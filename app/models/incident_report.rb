class IncidentReport < ApplicationRecord
  belongs_to :incident_type
  belongs_to :guard
  has_many :incident_participants
end
