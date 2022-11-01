Feature: view my own post

    As a Columbia student who has requested a task
    So that I can check I included the correct task information
    I want to view my requested task

Background: user is logged in
  Given I am a valid user
  And I am signed in
  And I have a task

Scenario: viewing my post
    When I go to My Profile page
    And I follow "Senior Photos"
    Then I should see "Senior Photos"
    And I should see "2 hr(s)"
    And I should see "Low Library Steps"
    And I should see "$30"

