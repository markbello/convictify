class IncidentReport < ApplicationRecord
  belongs_to :incident_type
  belongs_to :guard
  has_many :incident_participants
  has_many :prisoners, through: :incident_participants

  validates :content, presence: true

  def self.latest_incident_reports
    IncidentReport.all.last(3)
  end

  def short_desc
    self.content[0..75].gsub(/\s\w+\s*$/,'...')
  end

end
