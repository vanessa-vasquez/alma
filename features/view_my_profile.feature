Feature: view my profile

    As a student with a registered account
    So that I can see my tasks
    I want to view my profile page

Background: user is logged in
  Given I am a valid user
  And I am signed in
  And I have tasks

Scenario: view my user information
    When I go to My Profile page
    Then I should see "My Information"
    And I should see "Sally Jenkins"
    And I should see "sj1234@columbia.edu"
    And I should see "Columbia University"

Scenario: view my tasks
    When I go to My Profile page
    Then I should see "Senior Photos"