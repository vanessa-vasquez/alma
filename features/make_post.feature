Feature: make a post

    As a Columbia student
    So that I can get help with my task
    I want to post a new task

Scenario: All fields of the post form are completed 
When I am on the "Create Task" page
And I fill in "Task Name" with "Senior Photos"
And I fill in "Time Needed" with "1 hour"
And I fill in "Location" with "Low Steps"
And I fill in "Price" with "$50"
And I fill in "Description" with "Need an experienced photographer to take my grad photos"
And I press "Submit"
I should be on the "Senior Photos" information page

Scenario: Missing fields of the post form
When I am on the "Create Task" page
And I fill in "Task Name" with "Need batteries"
And I fill in "Time Needed" with "5 minutes"
And I fill in "Description" with "Does anybody have any extra AAA batteries? I just need two!"
And I press "Submit"
I should be on the "Create Task" page
And the "Location" field should have the error "Required field"
And the "Price" field should have the error "Required field"