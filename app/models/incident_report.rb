class IncidentReport < ApplicationRecord
  belongs_to :incident_type
  belongs_to :guard
  has_many :incident_participants
  has_many :prisoners, through: :incident_participants

  validates :content, presence: true

  def defendants
    instance_records = self.incident_participants.select do |incident_participant_record|
      incident_participant_record.prisoner_type == 2
    end
    defendant_ids = instance_records.map{|record| record.prisoner_id}
  end

  def plaintiffs
    instance_records = self.incident_participants.select do |incident_participant_record|
      incident_participant_record.prisoner_type == 1
    end
    plaintiff_ids = instance_records.map{|record| record.prisoner_id}
  end

  def self.latest_incident_reports
    IncidentReport.all.last(3)
  end

  def short_desc
    self.content[0..75].gsub(/\s\w+\s*$/,'...')
  end

end
