Feature: accept a task

    As a Columbia student who wants to accept a task
    So that I can accept a task that I want to do
    I want to accept a task

Background: user is logged in
    Given I am a valid user

Scenario: I am not signed in
    Given I am on the All Tasks page
    Then I should be on the home page

Scenario: I am signed in to accept a task
    Given I am signed in
    Given there are tasks posted by other users
    And I am on the All Tasks page
    Then I should see "Need brownie pan"
    And I follow "Accept task"
    Then I am on My Profile page 
    And I should see "Need brownie pan" 
