Feature: view my own post

    As a Columbia student who has requested a task
    So that I can check I included the correct task information
    I want to view my requested task

Scenario: viewing my post
When I am on the 'Profile' page
I should see ‘Task X’ within ‘Tasks Requested’
And when I follow ‘Task X’
I should be on the ‘Task X’ page
