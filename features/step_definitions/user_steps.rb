Given /I am a valid user/ do 
    User.create!({
        :id => 1,
        :fname => "Sally",
        :lname => "Jenkins",
        :password => "12345678",
        :email => "sj1234@columbia.edu",
        :school => "Columbia University"
      })
end

Given /I am signed in/ do
  visit new_user_session_path
  fill_in "user_email", :with => "sj1234@columbia.edu"
  fill_in "user_password", :with => "12345678"
  click_button "Log in"
end

Given /I have tasks/ do
  Task.create!({name: 'Senior Photos', hours: 2, deadline: DateTime.new(2022,12,5), location: 'Low Library Steps', price: 30,
  description: 'Seeking experienced photographer for Senior pics!', user_id: 1, completed: false})
end