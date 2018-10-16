# json.array! @guests do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end
# json.guests do
#   @guests.each do |guest|
#     json.partial! 'guest', guest: guest
#   end
# end

json.array! @guests do |guest|
  json.partial! 'guest', guest: guest
end
