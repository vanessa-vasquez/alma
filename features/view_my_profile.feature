Feature: view my profile

    As a student with a registered account
    So that I can see my tasks
    I want to view my profile page

Background: user is logged in
  Given I am a valid user
  And I am signed in

Scenario: view my user information
    When I am on the 'My Profile' page
    Then I should see ‘Task X’ within ‘Tasks Requested’
    And when I follow ‘Task X’
    Then I should be on the ‘Task X’ page

Scenario: view my tasks
    When I am on the 'Profile' page
    Then I should see ‘Task X’ within ‘Tasks Requested’
    And when I follow ‘Task X’
    Then I should be on the ‘Task X’ page