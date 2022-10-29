Features: delete a task

    As a Columbia student who has requested a task
    So that I can delete a task that I no longer want
    I want to delete a task

Scenario: delete a task
Given I am on the 'Task A' page
When I press "Delete"
Then I should be on the 'Profile' page 
And I should not see 'Task A'