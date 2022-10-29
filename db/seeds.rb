# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   # Tasks needs name, email, time_needed, when, location, price, description

tasks = [
  {name: 'Senior Photos', email: 'ejw2173@columbia.edu', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30,
  description: 'Seeking experienced photographer for Senior pics!'},
  {name: 'Need brownie pan', email: 'esg45@columbia.edu', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Carman Floor 5 Kitchen', price: 3,
    description: 'I am making brownies for my friends and need a pan!'},
  {name: 'Help moving out', email: 'fe642@barnard.edu', hours: 4, deadline: DateTime.new(2022,12,3), location: 'Woodbridge Hall', price: 60,
    description: 'Need help moving out of my dorm, will buy you lunch'},
  {name: 'Club Flyer', email: 'ab9031@barnard.edu', hours: 1, deadline: DateTime.new(2022,11,28), location: 'Online', price: 8,
    description: 'Bwog needs flyers to recruit our new members. Make us seem cool! Can use canva'},
  {name: 'Building furniture', email: 'esg45@columbia.edu', hours: 3, deadline: DateTime.new(2022,12,20), location: 'McBain Hall', price: 20,
    description: 'Do you know how to build a dresser? Help me out!'},
  {name: 'Pick up packages', email: 'fe642@barnard.edu', hours: .5, deadline: DateTime.new(2022,12,4), location: 'Wein Hall', price: 5,
    description: 'I have been procrastinating this for two weeks please help'},
  {name: 'LinkedIn profile pic needed', email: 'ejw2173@columbia.edu', hours: .5, deadline: DateTime.new(2022,11,5), location: 'Law Bridge', price: 10,
    description: 'Need someone to take a professional photo of me on the Law Bridge. Bring your own camera.'},
  {name: 'Makeup Needed', email: 'ab9031@barnard.edu', hours: 1, deadline: DateTime.new(2022,11,15), location: 'Furman Hall', price: 15,
    description: 'Need someone to do my makeup for my sorority formal'},
  {name: 'Take my survey for class', email: 'ab9031@barnard.edu', hours: .25, deadline: DateTime.new(2022,11,30), location: 'Online', price: 1,
    description: 'Help me pass my psych class by taking this short quiz on your personality'},
  {name: 'Buy me groceries', email: 'esg45@columbia.edu', hours: .5, deadline: DateTime.new(2022,12,11), location: 'Westside', price: 10,
    description: 'I will reimburse you + give $10. I need 1 lb chicken breast and soy sauce. Thanks!'}
]
tasks.each do |task|
  Task.create!(task)
end
# Need first name, last name, email, password, phone number
users = [
  {first_name: 'Elizabeth', last_name: 'Walker', email: 'ejw2173@columbia.edu', password: 'CatsAreKool1',
     phone_number: '8349258712'},
  {first_name: 'Edward', last_name: 'Gao', email: 'esg45@columbia.edu', password: 'ColumbiaRulez3',
    phone_number: '1344930193'},
  {first_name: 'Fiona', last_name: 'Edwards', email: 'fe642@barnard.edu', password: 'DianaFan21',
    phone_number: '9892648261'},
  {first_name: 'Amanda', last_name: 'Barnes', email: 'ab9031@barnard.edu', password: 'AmandaBanana',
    phone_number: '1239764927'}
]
users.each do |user|
  User.create!(user)
end