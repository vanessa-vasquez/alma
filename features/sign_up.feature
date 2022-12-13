Feature: sign up user
    As a Columbia student
    So that I can get help for my tasks
    I want to sign up for Alma 

Background: app is opened to home page
    Given I am on the home page
    When I follow "Signup"
    Then I should be on the sign up page

Scenario: make an account successfully (verified via authentication)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I select "Columbia" from "University"
    And I fill in "University Email" with "am1122@columbia.edu"
    And I fill in "Password" with "SecretOwl"
    And I fill in "Password confirmation" with "SecretOwl"
    When I press "Sign Up"
    Then I should be on the home page
    And I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."

Scenario: unsuccessful attempt at making an account (non university email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I select "Columbia" from "University"
    And I fill in "University Email" with "am1122@gmail.com"
    And I fill in "Password" with "SecretOwl"
    And I fill in "Password confirmation" with "SecretOwl"
    And I press "Sign Up"
    Then I should see "Email is not a university email"

Scenario: unsuccessful attempt at making an account (missing information- ex: email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I press "Sign Up"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"