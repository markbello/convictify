class Guard < ApplicationRecord
  belongs_to :cell_block
  has_many :incident_reports
  has_many :prisoners, through: :incident_reports
end
