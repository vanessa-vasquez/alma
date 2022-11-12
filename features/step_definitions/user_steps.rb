Given /I am a valid user/ do 
    User.create!({
        :id => 1,
        :fname => "Sally",
        :lname => "Jenkins",
        :password => "12345678",
        :email => "sj1234@columbia.edu",
        :school => "Columbia University",
        :confirmed_at => Time.now
      })
end

Given /I am signed in/ do
  visit new_user_session_path
  fill_in "user_email", :with => "sj1234@columbia.edu"
  fill_in "user_password", :with => "12345678"
  click_button "Log in"
end

Given /I have a task/ do
  Task.create!({name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30,
  description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false})
end


Given /there are tasks posted by other users/ do
  User.create!({
    :id => 2,
    :fname => "Billy",
    :lname => "Bob",
    :password => "12345678",
    :email => "bb1234@columbia.edu",
    :school => "Columbia University"
  })
  Task.create!({name: 'Need brownie pan', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Carman Floor 5 Kitchen', price: 3,
    description: 'I am making brownies for my friends and need a pan!', user_id: 2, completed: false})
  Task.create!({name: 'Wall painting', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Wallach 502', price: 35,
  description: 'I need help painting the wall of my dorm room.', user_id: 2, completed: false})
  Task.create!({name: 'Need help with club fair', hours: 3, deadline: DateTime.new(2022,12,6), location: 'Low Steps', price: 300,
  description: 'Need help making posters for the club fair.', user_id: 2, completed: false})
end