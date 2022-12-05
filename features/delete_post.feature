Feature: delete a task

    As a Columbia student who has requested a task
    So that I can delete a task that I no longer want
    I want to delete a task

Background: user is logged in
    Given I am a valid user
    And I am signed in
    And I have a task

Scenario: delete a task
    When I go to My Profile page
    And I follow "Senior Photos"
    Then I should be on the View Task page for "Senior Photos"
    And I should see "Edit Task"
    When I follow "Edit Task"
    Then I should be on the Edit Task page for "Senior Photos"
    And I follow "Delete Task"
    Then I am on My Profile page
    And I should not see "Senior Photos"
