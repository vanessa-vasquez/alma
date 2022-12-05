Feature: complete accepted task

    As a Columbia student who has accepted a task
    So that I can complete an accepted task that I want to complete
    I want to complete an accepted task

Background: user is logged in
    Given I am a valid user
    And I am signed in

Scenario: delete an accepted task
    Given I have accepted a task
    When I go to My Profile page
    And I follow "Grad Photos"
    Then I should be on the View Task page for "Grad Photos"
    And I should see "Mark as completed"
    When I follow "Mark as completed"
    Then I am on My Profile page
    And I should see "Grad Photos"
