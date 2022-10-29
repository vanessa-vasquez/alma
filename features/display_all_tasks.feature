Feature: display list of tasks

    As a Columbia student
    So that I can quickly browse tasks
    I want to see what tasks are available

Scenario: no available tasks 
    Given there are no tasks available
    And I am on the ‘All Tasks’ page
    Then 0 tasks should exist
    And I should see "No Tasks"

Scenario: available tasks
    Given there are tasks available 
    And I am on the ‘All Tasks’ page
    Then at least 1 task should exist