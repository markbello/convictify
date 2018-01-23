class Prisoner < ApplicationRecord
  belongs_to :cell
  has_many :incident_reports
  has_many :guard_prisoners
  has_many :guards, through: :guard_prisoners
end
