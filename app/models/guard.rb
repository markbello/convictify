class Guard < ApplicationRecord
  has_secure_password
  belongs_to :cell_block
  has_many :incident_reports
  has_many :guard_prisoners
  has_many :prisoners, through: :guard_prisoners

  def full_name
    "#{first_name} #{last_name}"
  end

end
