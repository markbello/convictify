class Guard < ApplicationRecord
  belongs_to :cell_block
  has_many :incident_reports
  #has_many :prisoners, through: :incident_reports
  #This relationship should perhaps become an instance method because indicent_reports now refers a level deeper into incident_participants to keep track of prisoners, as :defendants and :plaintiffs. The current model does not work

end
