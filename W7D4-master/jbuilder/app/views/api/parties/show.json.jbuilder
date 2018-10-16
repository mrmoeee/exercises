json.name @party.name

json.guests @party.guests.each do |guest|
  json.name guest.name
  json.gifts guest.gifts, :title
end
