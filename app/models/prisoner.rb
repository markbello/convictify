class Prisoner < ApplicationRecord
  belongs_to :cell
  has_many :guards, through: :incident_reports
  has_many :incident_reports
end
