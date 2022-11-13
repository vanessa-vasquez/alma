Feature: view my profile

    As a student with a registered account
    So that I can see my tasks
    I want to view my profile page

Background: user is logged in
  Given I am a valid user
  And I am signed in
  And I have a task

Scenario: view my user information
    When I go to My Profile page
    Then I should see "Account Information"
    And I should see "Sally Jenkins"
    And I should see "sj1234@columbia.edu"
    And I should see "Columbia University"

Scenario: view my tasks
    When I go to My Profile page
    Then I should see "Senior Photos"

Scenario: delete all tasks
    When I go to My Profile page
    And I follow "Delete All"
    Then I should not see "Senior Photos"
    And I should see "You have removed all your tasks!"

Scenario: logged out
    When I follow "Sign Out"
    Then I should be on the home page
    And I should see "Signed out successfully."
    And I go to My Profile page
    Then I should be on the home page