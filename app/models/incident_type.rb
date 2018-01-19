class IncidentType < ApplicationRecord
  has_many :incident_reports
end
