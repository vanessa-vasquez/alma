Feature: update a task
 
    As a Columbia student who has requested a task
    So that I can make changes to my task information
    I want to update a task

Scenario: I want to update a task (valid)
Given I am on the ‘Task A’ page
And I press ‘Update Page’ 
Then I should be on the ‘Update Task’ page
And when I fill in "Time Needed" with "1 hour"
And when I hit the ‘Submit Changes’ button
Then I should be on the ‘Task A' page
And I should see "1 hour" 

Scenario: I want to update a task (invalid)
Given I am on the ‘Task A’ page
And I press ‘Update Page’ 
Then I should be on the ‘Update Task’ page
And when I fill in "Time Needed" with ""
And when I hit the ‘Submit Changes’ button
Then I should be on the "Update Task" page
And the "Time Needed" field should have the error "Required field"
