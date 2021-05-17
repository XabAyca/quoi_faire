# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

10.times do |i|
  User.create(first_name:Faker::Games::SuperMario.character,last_name:Faker::Games::Pokemon.name,email:"fake.name#{i}@yopmail.com")
  puts "#{i+1} utilisateur(s) crée(s)" 
end