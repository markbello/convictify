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

seed_x_cells_per_block(15)

puts "Created Cells"

#CREATE INCIDENT TYPES
IncidentType.create(name: "Division by Zero", severity_rating: 1)

puts "Created Incident Types"

#CREATE PRISONERS
Prisoner.create(first_name: "Prison", last_name: "Official", release_date: "3018-09-10 00:00:00", conviction: "Staff Account", cell_id: 1)
Prisoner.create(first_name: "Mark", last_name: "Bello", release_date: "2018-09-10 00:00:00", conviction: "Division by Zero, First Degree", cell_id: 1)
Prisoner.create(first_name: "Oleg", last_name: "Chursin", release_date: "2018-09-10 00:00:00", conviction: "Accessory to Division by Zero, First Degree", cell_id: 1)

puts "Created Prisoners"

#CREATE GUARDS
Guard.create(first_name: "Bob", last_name: "Smith", cell_block_id: 1)

puts "Created Guards"

#CREATE INCIDENT REPORTS
IncidentReport.create(content: "Inmates apprehended while dividing by zero in Cell Block A. Inmate Bello appeared to take the lead, claiming he was \"only de-bugging.\"", guard_id: 1, incident_type_id: 1)

puts "Created Incident Reports"

#CREATE INCIDENT PARTICIPANTS

IncidentParticipant.create(incident_report_id: 1, defendant_id: 2, plaintiff_id: 1)
IncidentParticipant.create(incident_report_id: 1, defendant_id: 3, plaintiff_id: 1)

puts "Created Incident Participants"
