class Prisoner < ApplicationRecord
  belongs_to :cell
  has_many :incident_reports
  has_many :guard_prisoners
  has_many :guards, through: :guard_prisoners

  def name
    "#{first_name} #{last_name}"
  end

  def formatted_release_date
    self.release_date.strftime "%B %d, %Y"
  end

end
