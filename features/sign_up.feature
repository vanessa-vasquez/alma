Feature: sign up user

    As a Columbia student
    So that I can get help for my tasks
    I want to sign up for Alma 

Background: app is opened to home page

    Given I am on the home page
    When I follow "Sign Up"
    Then I should be on the sign up page
Scenario: make an account successfully (verified via authentication)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I fill in "School" with "Columbia"
    And I fill in "Email" with "am1122@columbia.edu"
    And I fill in "Password" with "SecretOwl"
    And I fill in "Password confirmation" with "SecretOwl"
    When I press "Sign up"
    Then I should be on the All Tasks page

Scenario: unsuccessful attempt at making an account (non Columbia email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I fill in "School" with "Columbia"
    And I fill in "Email" with "am1122@gmail.com"
    And I fill in "Password" with "SecretOwl"
    And I fill in "Password confirmation" with "SecretOwl"
    And I press "Sign up"
    Then I should see "Please use a university email"

Scenario: unsuccessful attempt at making an account (missing information- ex: email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I press "Sign up"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"

