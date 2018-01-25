class IncidentReport < ApplicationRecord
  belongs_to :incident_type
  belongs_to :guard
  has_many :incident_participants
  has_many :prisoners, through: :incident_participants

  validates :content, presence: true

end
