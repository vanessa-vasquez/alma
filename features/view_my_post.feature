Feature: view my own post

    As a Columbia student who has requested a task
    So that I can check I included the correct task information
    I want to view my requested task


Background: user is logged in
  Given I am a valid user

Scenario: I am not signed in
    Given I am on My Profile page
    Then I should be on the home page

Scenario: I am signed in and viewing my post
    Given I am signed in
    And I have a task
    When I go to My Profile page
    And I follow "Senior Photos"
    Then I should see "Senior Photos"
    And I should see "2.0 hr(s)"
    And I should see "Low Library Steps"
    And I should see "$30"

