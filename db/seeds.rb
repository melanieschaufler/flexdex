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
munich_central = {user: User.find_by_email("melanie@web.de"), address: "Seidlstraße 5, 80335 München", description:"Cozy workspace in the center with great facilities and a great ambience", price: 35, seats: 20, name:"Ruby Workspace Munich"}
hamburg_south = {user: User.find_by_email("melanie@web.de"), address: "Steinhöft 9, 20459 Hamburg", description:"Close to the Elbphilharmonie, great space for working, meetings and trainings", price: 30, seats: 25, name:"Ruby Workspace Hamburg"}
frankfurt_central = {user: User.find_by_email("louisa@web.de"), address: "Neue Mainzer Str. 66-68, 60311 Frankfurt am Main", description:"One of Frankfurt's top workspaces with a great concept and cordial staff", price: 20, seats: 35, name:"Mindspace EuroFra"}

berlin_north = {user: User.find_by_email("vincent@web.de"), address: "Brunnenstraße 64, 13355 Berlin", description:"Roomy workspace with wifi and free coffee in the north of Berlin", price: 45, seats: 25, name:"Unicorn Workspace Berlin AEG"}
munich_east = {user: User.find_by_email("carla@web.de"), address: "Atelierstraße 29, 81671 München", description:"The most startup friendly space in Munich where work feels even less like work ", price: 34, seats: 25, name:"WERK1"}
düsseldorf_central = {user: User.find_by_email("louisa@web.de"), address: "Breite Str. 22, 40213 Düsseldorf", description:"The impressive workspace is located in a top location in the city centre", price: 64, seats: 30, name:"CONTORA Office Solutions D"}

berlin_central = {user: User.find_by_email("vincent@web.de"), address: "Markgrafenstraße 62/63, 10969 Berlin", description:"Very friendly barista and great facilities for teams and individuals", price: 45, seats: 20, name:"Unicorn Workspace Checkpoint Charlie"}
hamburg_port = {user: User.find_by_email("carla@web.de"), address: "Überseeallee 1, 20457 Hamburg", description:"Great Prices, fast wifi, great coffe, free parking", price: 23, seats: 35, name:"ABC Workspaces Hafencity"}
frankfurt_oper = {user: User.find_by_email("louisa@web.de"), address: "Taunustor 1, 60329 Frankfurt am Main", description:"Style, design and character - perfect for meetings and for working.", price: 60, seats: 40, name:"CONTORA Office Solutions F"}

düsseldorf_north = {user: User.find_by_email("louisa@web.de"), address: "Oststraße 10, 40211 Düsseldorf", description:"The first cozy workspace with self-checking", price: 32, seats: 15, name:"BEEHIVE Düsseldorf"}
berlin_south = {user: User.find_by_email("vincent@web.de"), address: "Dudenstraße 10, 10965 Berlin", description:"Very good atmosphere, bright rooms, interesting people for nice conversations during the coffee break.", price: 27, seats: 20, name:"b+office"}
koeln_west = {user: User.find_by_email("melanie@web.de"), address: "Venloer Str. 240, 50823 Köln", description:"Cosy little coworking space with roof terrace and great coffee", price: 35, seats: 25, name:"Ehrenspace"}

munich_vitkualienmarkt = {user: User.find_by_email("carla@web.de"), address: "Rosental 6, 80331 München", description:"Cozy workspace with stable Wifi and openminded people", price: 55, seats: 20, name:"Unicorn Workspace Munich"}
hamburg_west = {user: User.find_by_email("louisa@web.de"), address: "Große Elbstraße 68, 22767 Hamburg", description:"Open workspace close to munich east station", price: 43, seats: 10, name:"stilwerk workspace"}
frankfurt_south = {user: User.find_by_email("carla@web.de"), address: "Mörfelder Landstraße 6-8, 60598 Frankfurt am Main", description:"Well located workspace with top equipment and interesting people", price: 20, seats: 30, name:"SleevesUp!"}


[ munich_central, hamburg_south, frankfurt_central, berlin_north, munich_east, düsseldorf_central, berlin_central, hamburg_port, frankfurt_oper, düsseldorf_north, berlin_south, koeln_west, munich_vitkualienmarkt, hamburg_west, frankfurt_south ].each do |attributes|
  workspace = Workspace.create!(attributes)
  puts "Created #{workspace.name}"
end
puts "Finished!"
