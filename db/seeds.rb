require "./db/seed_generator.rb"
seed_generator = SeedGenerator.new

#CREATE CELL BLOCKS
CellBlock.create(name: "A", security_rating: 1)
CellBlock.create(name: "B", security_rating: 2)
CellBlock.create(name: "C", security_rating: 3)
CellBlock.create(name: "D", security_rating: 4)
CellBlock.create(name: "E", security_rating: 5)

puts "Created Cell Blocks"

#CREATE INDIVIDUAL CELLS

def seed_x_cells_per_block(x)
  CellBlock.all.each do |block|
  counter = 1
    x.times do
      cell_name = "#{block.name}#{counter.to_s}"
      puts "Creating #{cell_name}"
      Cell.create(name: cell_name, cell_block_id: block.id)
      counter += 1
    end
  end
end

seed_x_cells_per_block(5)

puts "Created Cells"

#CREATE INCIDENT TYPES
IncidentType.create(name: "Division by Zero", severity_rating: 1)
IncidentType.create(name: "Assault", severity_rating: 4)
IncidentType.create(name: "Emotional Abuse", severity_rating: 2)

puts "Created Incident Types"

#CREATE PRISONERS
Prisoner.create(first_name: "Prison", last_name: "Official", intake_date: "2018-01-24 00:00:00", release_date: "3018-09-10 00:00:00", conviction: "Staff Account", cell_id: 1, nickname: 'The Prison')
# Prisoner.create(first_name: "Mark", last_name: "Bello", intake_date: "2018-01-24 00:00:00", release_date: "2018-09-10 00:00:00", conviction: "Division by Zero, First Degree", cell_id: 1, nickname: seed_generator.create_moniker("Mark"))
# Prisoner.create(first_name: "Oleg", last_name: "Chursin", intake_date: "2018-01-24 00:00:00", release_date: "2019-09-10 00:00:00", conviction: "Accessory to Division by Zero, First Degree", cell_id: 1, nickname: seed_generator.create_moniker("Oleg"))

cell_counter = 1
25.times do
  first_name = FactoryHelper::Name.male_first_name
  last_name = FactoryHelper::Name.last_name
  nickname = seed_generator.create_moniker(first_name)
  crime = seed_generator.assign_crime
  release_date = Faker::Time.forward(3650, :morning)
  cell_id = cell_counter
  cell_counter += 1
  prisoner = Prisoner.create(first_name: first_name, last_name:last_name, conviction: crime, intake_date: Time.now, release_date: release_date, cell_id: cell_id, nickname: nickname)
  puts "Convictified #{prisoner.nickname}"
end

puts "Convictified Prisoners"

#CREATE GUARDS
Guard.create(first_name: "Bob", last_name: "Smith", cell_block_id: 1, email: "guard1@gmail.com", password: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")
Guard.create(first_name: "Joe", last_name: "Clay", cell_block_id: 2, email: "guard2@gmail.com", password: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")
Guard.create(first_name: "Victor", last_name: "Nabokov", cell_block_id: 3, email: "guard3@gmail.com", password: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")
Guard.create(first_name: "Jason", last_name: "Newstead", cell_block_id: 4, email: "guard4@gmail.com", password: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")
g = Guard.create(first_name: "Frank", last_name: "Wright", cell_block_id: 5, email: "guard5@gmail.com", password: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")
puts "Created Guards"

#CREATE INCIDENT REPORTS
# IncidentReport.create(content: "Inmates apprehended while dividing by zero in Cell Block A. Inmate Bello appeared to take the lead, claiming he was \"only de-bugging.\"", guard_id: 1, incident_type_id: 1)

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

  incident_time = Faker::Time.backward(1)
  seed_generator.create_description(plaintiff, defendant, incident_time)

end

Prisoner.all.each do |prisoner|
  random_prisoner_index = rand(1..Prisoner.all.count - 1)
  plaintiff = Prisoner.all[random_prisoner_index]
  incident_time = Faker::Time.backward(1)
  seed_generator.create_description(plaintiff, prisoner, incident_time)
end

puts "Created Incident Reports with Participants"
