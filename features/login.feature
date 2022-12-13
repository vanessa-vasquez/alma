Feature: login user
    As a Columbia student 
    So that I can create a new task
    I want to login to my account on Alma

Background: app is opened to home page
    Given I am on the home page
    When I follow "Login"
    Then I should be on the login page

Scenario: login with correct details
    Given I am on the login page
    And I am a valid user
    When I fill in "Email" with "sj1234@columbia.edu"
    And I fill in "Password" with "12345678"
    When I press "Log In"
    Then I should be on the All Tasks page

Scenario: login with incorrect details
    Given I am on the login page
    When I fill in "Email" with "thisisnotanemail"
    And I fill in "Password" with "almamater"
    When I press "Log In"
    Then I should be on the login page