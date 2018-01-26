# require "pry"

class SeedGenerator

  def seed_data
    return {
    adjectives:
      ["Granny",
        "Psycho",
        "Child",
        "Student",
        "Hobo",
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
        "Doorman"],
    outside_crimes: [
        ["Burglar", "Burglary"],
        ["Arsonist", "Arson"],
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
        ["","Russian Government Affiliation"],
        ["", "Being a Putin Supporter"],
        ["", "Riding a Horse Barechested"]
      ],
      inside_crimes: [
        ["slapping", 2],
        ["spitting on", 2],
        ["punching", 2],
        ["shanking", 2],
        ["assaulting", 2],
        ["intimidating", 3],
        ["saying mean things to", 3],
        ["looking the wrong way at", 3],
        ["thinking unkind thoughts about", 3],
        ["tripping", 2],
        ["head-butting", 2],
        ["suplex-ing", 2],
        ["being less than fully present emotionally for", 3]
      ],
      prison_locations: [
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
      ],
      plaintiff_responses: [
        "unresponsive",
        "refuses to cooperate",
        "wants to talk to a lawyer",
        "claims innocence",
        "wants to call home",
        "requires immediate medical attention",
        "could really use a hug right now",
        "also accuses the defendant of",
        "wants to call his mama"
      ],
      accusations: [
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
        "forgetting their birthday",
        "hacking into the NSA",
        "being a gang leader",
        "being a bad friend",
        "having God-awful taste in music",
        "mis-quoting Bible verses",
        "thinking impure thoughts",
        "not understanding what ActiveRecord is",
        "dividing by zero",
        "proposing NaN for an RSPEC test"
      ]
    }
  end

  def rand_index(key)
    data = seed_data[key]
    idx = rand(data.count - 1)
    data[idx]
  end

  def create_moniker(name)
    noun = rand_index(:outside_crimes)[0]
    adjective = rand_index(:adjectives)
    "#{name} the #{adjective} #{noun}"
  end

  def assign_crime
    rand_index(:outside_crimes)[1]
  end

  def create_description(plaintiff, defendant, timestamp)
    verb = rand_index(:inside_crimes)
    incident_type = verb[1]
    # byebug
    location = rand_index(:prison_locations)
    location2 = rand_index(:prison_locations)
    plaintiff_response = rand_index(:plaintiff_responses)
    defendant_response = rand_index(:accusations)
    random_guard_index = rand(1 .. (Guard.all.count - 1))
    guard = Guard.find(random_guard_index)

    if plaintiff_response == "also accuses the defendant of"
      plaintiff_accusation = rand_index(:accusations)
      plaintiff_response += " #{plaintiff_accusation}"
      if defendant_response == plaintiff_accusation
        defendant_response = rand_index(:accusations)
      end
    end
    # byebug
    defendant_name = "#{defendant[:first_name]} #{defendant[:last_name]}"
    plaintiff_name = "#{plaintiff[:first_name]} #{plaintiff[:last_name]}"
   formatted_time = timestamp.strftime("%H:%M")
   desc = "#{defendant_name} is accused of #{verb[0]} #{plaintiff_name} #{location} at approximately #{formatted_time}. #{defendant[:last_name]} accused #{plaintiff[:last_name]} of #{defendant_response} #{location2} before the incident."
   incident = IncidentReport.create(content: desc, guard_id: guard.id, incident_type_id: incident_type)
   IncidentParticipant.create(incident_report_id: incident.id, prisoner_id: plaintiff.id, prisoner_type: 1)
   IncidentParticipant.create(incident_report_id: incident.id, prisoner_id: defendant.id, prisoner_type: 2)
   GuardPrisoner.find_or_create_by(guard_id: guard.id, prisoner_id: plaintiff.id)
   GuardPrisoner.find_or_create_by(guard_id: guard.id, prisoner_id: defendant.id)
   puts desc
  end

end
