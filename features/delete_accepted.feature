Feature: delete accepted task

    As a Columbia student who has accepted a task
    So that I can delete an accepted task that I no longer want to complete
    I want to delete an accepted task

Background: user is logged in
    Given I am a valid user
    And I am signed in
    And I have a task

Scenario: delete an accepted task
    Given I have accepted a task
    When I go to My Profile page
    And I follow "Grad Photos"
    Then I should be on the View Task page for "Grad Photos"
    And I should see "Unaccept task"
    When I follow "Unaccept task"
    Then I am on My Profile page
    And I should not see "Grad Photos"
