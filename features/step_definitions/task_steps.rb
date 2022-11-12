

Given /the following tasks exist/ do |tasks_table|
  tasks_table.hashes.each do |task|
    Task.create!(task)
  end
end

Then /(.*) seed tasks should exist/ do | n_seeds |
  expect(Task.count).to eq n_seeds.to_i
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m 
  
  expect(page.body).to match(regexp)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  pending "Fill in this step in movie_steps.rb"
end

Then /^I should (not )?see the following movies: (.*)$/ do |no, movie_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  pending "Fill in this step in movie_steps.rb"
end

Then /I should see all the tasks/ do
  # Make sure that all the movies in the app are visible in the table
  pending "Fill in this step in movie_steps.rb"
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end
