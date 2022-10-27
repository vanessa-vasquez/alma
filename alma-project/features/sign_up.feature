Feature: sign up user

    As a Columbia student
    So that I can get help for my tasks
    I want to sign up for Alma 

Background: app is opened to home page

    Given I am on the home page
    When I press "sign up"
    Then I should be on the sign up page

Scenario: make an account successfully (verified via authentication)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I fill in "University Email" with "am1122@columbia.edu"
    And I fill in "Phone Number" with "2021112222"
    And I press "Create"
    Then I should be on the profile page for "am1122"

Scenario: unsuccessful attempt at making an account (non Columbia email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I fill in "University Email" with "am1122@gmail.com"
    And I fill in "Phone Number" with "2021112222"
    And I press "Create"
    Then I should see "Please use a Columbia University email"

Scenario: unsuccessful attempt at making an account (missing information- ex: email)
    Given I am on the sign up page
    When I fill in "First Name" with "Alma"
    And I fill in "Last Name" with "Mater"
    And I fill in "Phone Number" with "2021112222"
    And I press "Create"
    Then I should see "Please fill in all fields"

