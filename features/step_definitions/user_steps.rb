Given /I am a valid user/ do 
    User.create!({
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