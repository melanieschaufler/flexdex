# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
User.destroy_all
puts "Creating user"
melanie = {email: "melanie@web.de", password: "123456"}
carla = {email: "carla@web.de", password: "123456"}
louisa = {email: "louisa@web.de", password: "123456"}
vincent = {email: "vincent@web.de", password: "123456"}
[ melanie, vincent, carla, louisa ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end
puts "Finished!"
puts "Cleaning database..."
Workspace.destroy_all
puts "Creating workspaces"
munich_central = {user: User.find_by_email("melanie@web.de"), address: "Hohenzollernstraße 18", description:"Cozy workspace with stable Wifi and openminded people", price: 15, seats: 20, name:"Foodora open space"}
munich_east = {user: User.find_by_email("carla@web.de"), address: "Regerstraße 100", description:"Open workspace close to munich east station", price: 23, seats: 25, name:"BCG workspace"}
frankfurt_central = {user: User.find_by_email("carla@web.de"), address: "Gallusstraße 20", description:"Comfortable workspace close to FFM central station", price: 7, seats: 40, name:"Deutsche Bank Finance workspace"}
[ munich_central, munich_east, frankfurt_central ].each do |attributes|
  workspace = Workspace.create!(attributes)
  puts "Created #{workspace.name}"
end
puts "Finished!"
