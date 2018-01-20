

#CRIME MONIKER ADJECTIVES

adjectives = [
    "Granny",
    "Psycho",
    "Child",
    "Student",
    "Hobo",
    "Priest",
    "Artist",
    "Bully",
    "Dog",
    "Cat",
    "Animal",
    "Cow",
    "Horse",
    "Baby",
    "Con",
    "Cop",
    "Dentist",
    "Doctor",
    "Therapist",
    "Janitor",
    "Doorman"
  ]

#CRIME MONIKER NOUNS

nouns = [
    ["Burglar", "Burglary"],
    ["Arsonist", "Arson"],
    ["Rapist", "Rape"],
    ["Teaser", "Harrassment"],
    ["Torturer", "Assault"],
    ["Vandal", "Vandalism"],
    ["Hater", "Harrassment"],
    ["Poacher", "Poaching"],
    ["Pimp", "Prostitution"],
    ["Murderer", "Murder"],
    ["Killer", "Murder"],
    ["Kindapper", "Kidnapping"],
    ["Conspirator", "Conspiracy"],
    ["Abuser", "Abuse"],
    ["Neglector", "Negligence"],
    ["Impaler", "Murder"],
    ["Con", "Fraud"],
    ["Fraudster", "Fraud"],
    ["Shooter", "Murder"],
    ["Harrasser", "Harrassment"],
    ["Stalker", "Stalking"],
    ["Bully", "Harrassment"],
    ["Terrorist", "Terrorism"],
    ["Crimelord", "Conspiracy"],
    ["Stabber", "Murder"],
    ["Puncher", "Assault"],
    ["Kicker", "Assault"],
    ["Thief", "Theft"],
    ["", "Human Trafficking"],
    ["", "Division by Zero"],
    ["", "Late Blog Sumbission"],
    ["", "Trespassing"],
    ["", "Public Indecency"],
    ["", "Drug Trafficking"],
    ["", "Burnt the Casserole"],
    ["", "Shoplifting"],
    ["", "Failure to Signal"],
    ["", "Tax Evasion"],
    ["", "DWI"],
    ["", "Crimes Against Humanity"],
  ]

#CRIME MONIKERS

def create_moniker(name, nouns, adjectives)
  @noun = nouns[rand(nouns.count)][0]
  @adjective = adjectives[rand(adjectives.count)]
  "#{name} the #{@adjective} #{@noun}"
end

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
Prisoner.create(first_name: "Mark", last_name: "Bello", release_date: "2018-09-10 00:00:00", conviction: "Division by Zero, First Degree", cell_id: 1, nickname: create_moniker("Mark", nouns, adjectives))
Prisoner.create(first_name: "Oleg", last_name: "Chursin", release_date: "2018-09-10 00:00:00", conviction: "Accessory to Division by Zero, First Degree", cell_id: 1, nickname: create_moniker("Oleg", nouns, adjectives))

50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  cell_id = rand(1 .. 10)
  Prisoner.create(first_name: first_name, last_name:last_name, conviction: nouns[rand(nouns.count)][1], release_date: "2018-09-10 00:00:00", cell_id: cell_id, nickname: create_moniker(first_name, adjectives, nouns))
  puts "Imprisoned #{create_moniker(first_name, nouns, adjectives)}"
end

puts "Created Prisoners"

#CREATE GUARDS
Guard.create(first_name: "Bob", last_name: "Smith", cell_block_id: 1)

puts "Created Guards"

#CREATE INCIDENT REPORTS
IncidentReport.create(content: "Inmates apprehended while dividing by zero in Cell Block A. Inmate Bello appeared to take the lead, claiming he was \"only de-bugging.\"", guard_id: 1, incident_type_id: 1)

#INCIDENT DESCRIPTION GENERATOR

verbs = [
  ["slapping", "Assault"],
  ["spitting on", "Assault"],
  ["punching", "Assault"],
  ["shanking", "Assault"],
  ["assaulting", "Assault"],
  ["intimidating", "Emotional Abuse"],
  ["saying mean things to", "Emotional Abuse"],
  ["looking the wrong way at", "Emotional Abuse"],
  ["thinking unkind thoughts about", "Emotional Abuse"],
  ["tripping", "Assault"],
  ["head-butting", "Assault"],
  ["suplex-ing", "Assault"],
  ["being less than fully present emotionally for", "Emotional Abuse"],
]

locations = [
  "on the lunch line",
  "on the breakfast line",
  "on the dinner line",
  "in the laundry room",
  "in the showers",
  "in the cell block common area",
  "in the prison library",
  "by the phones",
  "at the commissary",
  "in the visiting area",
  "on the way to the visiting area",
  "in the defendant's cell",
  "in the prison yard",
  "by the weight benches"
]

plaintiff_responses = [
  "unresponsive",
  "refuses to cooperate",
  "wants to talk to a lawyer",
  "claims innocence",
  "wants to call home",
  "requires immediate medical attention",
  "could really use a hug right now",
  "also accuses the defendant of"
]

accusations = [
  "trafficking narcotics",
  "trafficking miscellaneous contraband",
  "possessing a shiv",
  "possessing miscellaneous contraband",
  "planning an escape",
  "planning a riot",
  "working out too much",
  "having severe halitosis",
  "needing to take a chill pill",
  "brewing pruno in the toilet",
  "having a filthy, dirty mouth",
  "committing crimes against humanity",
  "talking smack about the other's mama",
  "having poor boundaries",
  "planning on shanking a guard",
  "forgetting their",
  "hacking into the NSA",
  "being a gang leader",
  "being a bad friend",
  "having God-awful taste in music",
  "mis-quoting Bible verses",
  "thinking impure thoughts"
]


def create_description(plaintiff, defendant, timestamp, verbs, locations, plaintiff_responses, accusations)
  verb = verbs[rand(verbs.count)][0]
  location = locations[rand(locations.count)]

  location2 = locations[rand(locations.count)]
  plaintiff_response = plaintiff_responses[rand(plaintiff_responses.count)]
  defendant_response = accusations[rand(accusations.count)]

  if plaintiff_response == "also accuses the defendant of"
    plaintiff_accusation = accusations[rand(accusations.count)]
    plaintiff_response += " #{plaintiff_accusation}"
    if defendant_response == plaintiff_accusation
      defendant_response = accusations[rand(accusations.count)]
    end
  end

   # description = {}
   description = "#{defendant} is accused of #{verb} #{plaintiff} #{location} at approximately #{timestamp}. #{defendant} accused #{plaintiff} of #{defendant_response} #{location2} before the incident."
   # description[:type] = verbs.index(verb)[1]
   description
end

40.times do
  rand1 = rand(2..Prisoner.all.count - 1)
  rand2 = rand(2..Prisoner.all.count - 1)

  if rand1 == rand2
    rand2 = rand(2..Prisoner.all.count - 1)
  end

  plaintiff = Prisoner.all[rand1]

  if !plaintiff.first_name
    plaintiff = Prisoner.all[rand(2..Prisoner.all.count - 1)]
  end

  defendant = Prisoner.all[rand2]

  if !defendant.first_name
    defendant = Prisoner.all[rand(2..Prisoner.all.count - 1)]
  end

  desc = create_description(plaintiff.first_name, defendant.first_name, "1400 hours", verbs, locations, plaintiff_responses, accusations)
  puts desc
  incident = IncidentReport.create(content: desc, guard_id: 1, incident_type_id: 2)
  IncidentParticipant.create(incident_report_id: incident.id, plaintiff_id: plaintiff.id || 2, defendant_id: defendant.id || 3)
end


puts "Created Incident Reports with Participants"

#CREATE INCIDENT PARTICIPANTS

IncidentParticipant.create(incident_report_id: 1, defendant_id: 2, plaintiff_id: 1)
IncidentParticipant.create(incident_report_id: 1, defendant_id: 3, plaintiff_id: 1)

puts "Created Incident Participants"
