
class Prisoner < ApplicationRecord
  belongs_to :cell
  has_many :incident_participants
  has_many :incident_reports, through: :incident_participants
  has_many :guard_prisoners
  has_many :guards, through: :guard_prisoners

  validates :first_name, presence: true
  validates :last_name, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

  def formatted_release_date
    self.release_date.strftime "%B %d, %Y"
  end

  def formatted_intake_date
    self.intake_date.strftime "%B %d, %Y"
  end

  def convictify(first_name)
    generator = SeedGenerator.new
    #nickname
    self.nickname = generator.create_moniker(first_name)
    #conviction
    self.conviction = generator.assign_crime
    #intake_date
    self.intake_date = Time.now
    #release_date
    # Random time in the future (up to maximum of N days)
    self.release_date = Faker::Time.forward(3650, :morning) # => "2118-09-26 06:54:47 -0700"
    #cell_id
    self.cell_id = rand(1..(Cell.all.count - 1))
    #byebug
    self.save
  end

  def cellmates
    cellmates = []
    self.cell.prisoners.each do |prisoner|
      if prisoner != self
        cellmates << prisoner
      end
    end
    cellmates.delete_if { |cellmate| cellmate.first_name == "Prison" }
    cellmates
  end

  def self.inmates
    inmates = []
    Prisoner.all.each do |prisoner|
      inmates << prisoner if prisoner.first_name != "Prison"
    end
    inmates
  end

  def self.latest_prisoners
    Prisoner.all.last(3)
  end

end
