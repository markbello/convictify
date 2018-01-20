# :defendant is accused of (verbing) :plaintiff
# (at location) at approximately (timestamp).
#
# :plaintiff (unresponsive/claims to know nothing of the incident/)
#
# :defendant claims :plaintiff (did some other crime)

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
  "planning and escape",
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
  "forgetting his manners",
  "hacking into the NSA",
  "being a gang leader",
  "being a bad friend",
  "having God-awful taste in music"
]

def create_description(plaintiff, defendant, timestamp, verbs, locations, plaintiff_responses, accusations)
  verb = verbs[rand(verbs.count)][0]
  location = locations[rand(locations.count)]
  plaintiff_response = plaintiff_responses[rand(plaintiff_responses.count)]
  defendant_response = accusations[rand(accusations.count)]

  if plaintiff_response == "also accuses the defendant of"
    plaintiff_accusation = accusations[rand(accusations.count)]
    plaintiff_response += " #{plaintiff_accusation}"
    if defendant_response == plaintiff_acusation
      defendant_response = accusations[rand(accusations.count)]
    end
  end

   description = {}
   description[:content] = "#{defendant} is accused of #{verb} #{plaintiff} #{location} at approximately #{timestamp}. #{defendant} accused #{plaintiff} of #{defendant_response} #{location} before the incident."
   description[:type] = verbs.index(verb)[1]
   description
end

10.times do
  desc = create_description(Prisoner.all(rand), Prisoner.all(rand), Time.now, verbs, locations, plaintiff_responses, accusations)
  puts desc[:content]
end
