# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   # Tasks needs name, hours, deadline, location, price, description, user_id, completed

tasks = [
  {name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30,
  description: 'Seeking experienced photographer for Senior pics!', user_id: 5, completed: false, user_accepted_id: 0},
  {name: 'Need brownie pan', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Carman Floor 5 Kitchen', price: 3,
    description: 'I am making brownies for my friends and need a pan!', user_id: 6, completed: false, user_accepted_id: 0},
  {name: 'Help moving out', hours: 4, deadline: DateTime.new(2022,12,3), location: 'Woodbridge Hall', price: 60,
    description: 'Need help moving out of my dorm, will buy you lunch', user_id: 6, completed: false, user_accepted_id: 0},
  {name: 'Club Flyer', hours: 1, deadline: DateTime.new(2022,11,28), location: 'Online', price: 8,
    description: 'Bwog needs flyers to recruit our new members. Make us seem cool! Can use canva', user_id: 6, completed: false, user_accepted_id: 0},
  {name: 'Building furniture', hours: 3, deadline: DateTime.new(2022,12,20), location: 'McBain Hall', price: 20,
    description: 'Do you know how to build a dresser? Help me out!', user_id: 5, completed: false, user_accepted_id: 0},
  {name: 'Pick up packages', hours: 0.5, deadline: DateTime.new(2022,12,4), location: 'Wein Hall', price: 5,
    description: 'I have been procrastinating this for two weeks please help', user_id: 6, completed: false, user_accepted_id: 0},
  {name: 'LinkedIn profile pic needed', hours: 0.5, deadline: DateTime.new(2022,11,5), location: 'Law Bridge', price: 10,
    description: 'Need someone to take a professional photo of me on the Law Bridge. Bring your own camera.', user_id: 5, completed: false, user_accepted_id: 0},
  {name: 'Makeup Needed', hours: 1, deadline: DateTime.new(2022,11,15), location: 'Furman Hall', price: 15,
    description: 'Need someone to do my makeup for my sorority formal', user_id: 6, completed: false, user_accepted_id: 0},
  {name: 'Take my survey for class', hours: 0.25, deadline: DateTime.new(2022,11,30), location: 'Online', price: 1,
    description: 'Help me pass my psych class by taking this short quiz on your personality', user_id: 5, completed: false, user_accepted_id: 0},
  {name: 'Buy me groceries', hours: 0.5, deadline: DateTime.new(2022,12,11), location: 'Westside', price: 10,
    description: 'I will reimburse you + give $10. I need 1 lb chicken breast and soy sauce. Thanks!', user_id: 6, completed: false, user_accepted_id: 0}
]
tasks.each do |task|
  Task.create!(task)
end
# Need email, encryped password, fname, lname, school
users = [
  {email: 'ad25@columbia.edu', password: 'CatsAreKool1', fname: 'Adam', lname: 'Daniels', school: 'Columbia University'},
  {email: 'js45@columbia.edu', password: 'ColumbiaRulez3', fname: 'Jane', lname: 'Stanley', school: 'Columbia University' },
  {email: 'pan642@barnard.edu', password: 'DianaFan21', fname: 'Patricia', lname: 'Johnson', school: 'Barnard College'},
  {email: 'sap@nyu.edu', password: 'AmandaBanana', fname: 'Sean', lname: 'Patch', school: 'NYU'}
]
users.each do |user|
  User.create!(user)
end