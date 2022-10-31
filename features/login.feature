Feature: login user
    As a Columbia student 
    So that I can create a new task
    I want to login to my account on Alma

Background: app is opened to home page

    Given I am on the home page
    When I follow "Login"

Scenario: login with correct details
    Given I am on the login page
    When I fill in "Email" with "ad25@columbia.edu"
    And I fill in "Password" with "CatsAreKool1"
    And I press "Log in"
    Then I should be on the tasks page

Scenario: login with incorrect details
    Given I am on the login page
    When I fill in "Email" with "thisisnotanemail"
    And I fill in "Password" with "almamater"
    And I press "Log in"
    Then I should see "Incorrect login information"