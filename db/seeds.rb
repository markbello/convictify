require "./db/seed_generator.rb"
seed_generator = SeedGenerator.new

#CREATE CELL BLOCKS
CellBlock.create(name: "A", security_rating: 1)
CellBlock.create(name: "B", security_rating: 2)
CellBlock.create(name: "C", security_rating: 3)
CellBlock.create(name: "D", security_rating: 4)
CellBlock.create(name: "E", security_rating: 5)
CellBlock.create(name: "F", security_rating: 6)
CellBlock.create(name: "G", security_rating: 7)
CellBlock.create(name: "H", security_rating: 8)
CellBlock.create(name: "I", security_rating: 9)
CellBlock.create(name: "J", security_rating: 10)

puts "Created Cell Blocks"

#CREATE INDIVIDUAL CELLS

def seed_x_cells_per_block(x)
  CellBlock.all.each do |block|
  counter = 1
    x.times do
      cell_name = block.name + counter.to_s
      Cell.create(name: cell_name, cell_block_id: block.id)
    end
  end
end

seed_x_cells_per_block(10)

puts "Created Cells"

#CREATE INCIDENT TYPES
IncidentType.create(name: "Division by Zero", severity_rating: 1)
IncidentType.create(name: "Assault", severity_rating: 4)
IncidentType.create(name: "Emotional Abuse", severity_rating: 2)

puts "Created Incident Types"

#CREATE PRISONERS
Prisoner.create(first_name: "Prison", last_name: "Official", release_date: "3018-09-10 00:00:00", conviction: "Staff Account", cell_id: 1, nickname: 'The Prison')
Prisoner.create(first_name: "Mark", last_name: "Bello", release_date: "2018-09-10 00:00:00", conviction: "Division by Zero, First Degree", cell_id: 1, nickname: seed_generator.create_moniker("Mark"))
Prisoner.create(first_name: "Oleg", last_name: "Chursin", release_date: "2018-09-10 00:00:00", conviction: "Accessory to Division by Zero, First Degree", cell_id: 1, nickname: seed_generator.create_moniker("Oleg"))

50.times do
  first_name = FactoryHelper::Name.male_first_name
  last_name = FactoryHelper::Name.last_name
  cell_id = rand(1 .. 10)
  nickname = seed_generator.create_moniker(first_name)
  crime = seed_generator.assign_crime
  prisoner = Prisoner.create(first_name: first_name, last_name:last_name, conviction: crime, release_date: "2018-09-10 00:00:00", cell_id: cell_id, nickname: nickname)
  puts "Imprisoned #{prisoner.nickname}"
end

puts "Created Prisoners"

#CREATE GUARDS
Guard.create(first_name: "Bob", last_name: "Smith", cell_block_id: 1)

puts "Created Guards"

#CREATE INCIDENT REPORTS
IncidentReport.create(content: "Inmates apprehended while dividing by zero in Cell Block A. Inmate Bello appeared to take the lead, claiming he was \"only de-bugging.\"", guard_id: 1, incident_type_id: 1)

40.times do

  prisoners_array = []

  rand1 = rand(2..Prisoner.all.count - 1)
  rand2 = rand(2..Prisoner.all.count - 1)

  if rand1 == rand2
    rand2 = rand(2..Prisoner.all.count - 1)
  end


  plaintiff = Prisoner.all[rand1]

  if !plaintiff.first_name
    plaintiff = Prisoner.all[rand(1..Prisoner.all.count - 1)]
  end

  defendant = Prisoner.all[rand2]

  if !defendant.first_name
    defendant = Prisoner.all[rand(2..Prisoner.all.count - 1)]
  end

  prisoners_array << plaintiff
  prisoners_array << defendant


  desc = seed_generator.create_description(plaintiff.first_name, defendant.first_name, "1400 hours")
  puts desc
  incident = IncidentReport.create(content: desc, guard_id: 1, incident_type_id: 2)
  IncidentParticipant.create(incident_report_id: incident.id, plaintiff_id: plaintiff.id || 2, defendant_id: defendant.id || 3)

  incident_guard = Guard.find(1)

  prisoners_array.each do |prisoner|
    if incident_guard.prisoners.include?(prisoner)
      puts "Guard has prisoner"
    else
      GuardPrisoner.create(guard_id: incident_guard.id, prisoner_id: prisoner.id)
      puts "Added prisoner to Guard"
    end
  end
end


puts "Created Incident Reports with Participants"

#CREATE INCIDENT PARTICIPANTS

IncidentParticipant.create(incident_report_id: 1, defendant_id: 2, plaintiff_id: 1)
IncidentParticipant.create(incident_report_id: 1, defendant_id: 3, plaintiff_id: 1)

puts "Created Incident Participants"

#TEST FOR EXISTING GUARD_PRISONERS

existing_prisoners_array = []

mark = Prisoner.find(2)
oleg = Prisoner.find(3)
guard = Guard.first

existing_prisoners_array << mark
existing_prisoners_array << oleg

existing_prisoners_array.each do |prisoner|
  #byebug
  if guard.prisoners.include?(prisoner)
    puts "Guard has existing prisoner (failed)"
  else
    guard.prisoners << prisoner
    puts "Added prisoner to Guard (passed)"
  end
end
