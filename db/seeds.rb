# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  Event.create({name: Faker::Music.instrument, date_start: Faker::Date.forward(200)})
end

50.times do

  User.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: "m", interested_f?: true, interested_m?:false})
  User.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gender: "f", interested_f?: false, interested_m?:true})

end

users = User.all
events = Event.all
pairings = Pairing.all

users.each_with_object(events) do |user, events|
  user.events = events.sample(6)
end

users.each do |user|
  user.set_pairs
  user.set_interest_ranks
end

pairings.each do |pairing|
  pairing.set_rating
end
