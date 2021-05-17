# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do |i|
  User.create(first_name:Faker::Games::SuperMario.character,last_name:Faker::Games::Pokemon.name,email:"fake.name#{i}@yopmail.com")
  puts "#{i+1} utilisateur(s) crée(s)" 
end

puts "*"*20

10.times do |i|
   e = Event.create(start_date:Faker::Date.between(from: Date.today, to:100.days.after),duration:[5,10,15,20,25,30,35,40,45].sample,title:Faker::Creature::Animal.name,description:Faker::ChuckNorris.fact,price:rand(1..900),location:Faker::Address.street_name,admin_id:User.all.sample.id)
  puts "#{i+1} évènement(s) crée(s)"
end

puts "*"*20

30.times do |i|
  Attendance.create(stripe_customer:i,user_id:User.all.sample.id,event_id:Event.all.sample.id)
  puts "#{i+1} réservation(s) enregistrée(s)"
end

puts "*"*20