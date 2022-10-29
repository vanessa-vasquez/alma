Feature: view someone else’s post

    As a Columbia student who wants to complete some task
    So that I can learn more information about a particular task
    I want to view someone else’s post

Scenario: viewing someone else's post
When I am on the ‘All Tasks’ page
Then I should be able to see ‘Task X’ 
And when I follow ‘Task X’
Then I should be on the ‘Task X’ page
