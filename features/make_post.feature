Feature: make a post

    As a Columbia student
    So that I can get help with my task
    I want to post a new task

Background: user is logged in
    Given I am a valid user
    And I am signed in

Scenario: All fields of the post form are completed 
    When I am on the Create Task page
    And I fill in "Task Name" with "Senior Photos"
    And I fill in "Time Needed" with "1"
    And I fill in "Location" with "Low Steps"
    And I fill in "Price" with "50"
    And I fill in "Description" with "Need an experienced photographer to take my grad photos"
    And I press "Create"
    Then I should be on My Profile page
    And I should see "Senior Photos"

Scenario: Missing fields of the post form (invalid)
    When I am on the Create Task page
    And I fill in "Time Needed" with "5"
    And I fill in "Description" with "Does anybody have any extra AAA batteries? I just need two!"
    And I press "Create"
    Then I should be on the Create Task page
    And I should see "Name can't be blank"

Scenario: Non-Numeric value for Time (invalid)
    When I am on the Create Task page
    And I fill in "Task Name" with "Batteries Needed"
    And I fill in "Time Needed" with "2 hours"
    And I fill in "Location" with "Wien Hall"
    And I fill in "Price" with "15"
    And I fill in "Description" with "Does anybody have any extra AAA batteries? I just need two!"
    And I press "Create"
    Then I should be on the Create Task page
    And I should see "Hours is not a number"