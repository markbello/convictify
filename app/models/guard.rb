class Guard < ApplicationRecord
  belongs_to :cell_block
  has_many :incident_reports
  has_many :guard_prisoners
  has_many :prisoners, through: :guard_prisoners

end
