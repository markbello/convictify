class Guard < ApplicationRecord
  has_secure_password
  belongs_to :cell_block
  has_many :incident_reports
  has_many :guard_prisoners
  has_many :prisoners, through: :guard_prisoners

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates_email_format_of :email, :message => 'does not appear to be a valid e-mail address'


  def full_name
    "#{first_name} #{last_name}"
  end

end
