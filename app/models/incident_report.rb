class IncidentReport < ApplicationRecord
  belongs_to :incident_type
  belongs_to :guard
  has_many :incident_participants
  has_many :prisoners, through: :incident_participants

  # def incident_prisoners_hash
  #   incident_prisoners_hash = {}
  #   incident_prisoners_hash[:incident_report_id] = self.id
  #   incident_prisoners_hash[:defendants] = []
  #   incident_prisoners_hash[:plaintiffs] = []
  #   incident_prisoners_hash[:all_prisoners] = []
  #
  #   self.incident_participants.each do |participants_record|
  #     defendant_id = participants_record.defendant_id
  #     plaintiff_id = participants_record.plaintiff_id
  #     incident_prisoners_hash[:defendants] << defendant_id if !incident_prisoners_hash[:defendants].include?(defendant_id)
  #     incident_prisoners_hash[:plaintiffs] << plaintiff_id if !incident_prisoners_hash[:plaintiffs].include?(plaintiff_id)
  #     incident_prisoners_hash[:all_prisoners] = incident_prisoners_hash[:defendants] + incident_prisoners_hash[:plaintiffs]
  #   end
  #   incident_prisoners_hash
  # end
end
