Feature: update a task
 
    As a Columbia student who has requested a task
    So that I can make changes to my task information
    I want to update a task

Background: user is logged in
    Given I am a valid user
    And I am signed in
    And I have a task
    When I go to My Profile page
    And I follow "Senior Photos"
    Then I should be on the View Task page for "Senior Photos"
    And I should see "Edit Task"
    When I follow "Edit Task"
    Then I should be on the Edit Task page for "Senior Photos"

Scenario: I want to update a task name (valid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Task Name" with "Junior Photos"
    And I press "Update"
    Then I should be on My Profile page
    And I should see "Junior Photos"
    When I follow "Junior Photos"
    Then I should see "Junior Photos"

Scenario: I want to update a task time (valid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Time Needed" with "5"
    And I press "Update"
    Then I should be on My Profile page
    And I should see "Senior Photos"
    When I follow "Senior Photos"
    Then I should see "Time Needed: 5 hr(s)"

Scenario: Missing name (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Task Name" with ""
    And I press "Update"
    Then I should see "Name can't be blank"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Missing hours (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Time Needed" with ""
    And I press "Update"
    Then I should see "Hours can't be blank"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Missing location (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Location" with ""
    And I press "Update"
    Then I should see "Location can't be blank"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Missing price (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Price" with ""
    And I press "Update"
    Then I should see "Price can't be blank"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Missing description (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Description" with ""
    And I press "Update"
    Then I should see "Description can't be blank"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Less than 0 hours (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Time Needed" with "-10"
    And I press "Update"
    Then I should see "Hours must be greater than or equal to 0"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Less than 0 price (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Price" with "-10"
    And I press "Update"
    Then I should see "Price must be greater than or equal to 0"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Non-numeric hours (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Time Needed" with "abc"
    And I press "Update"
    Then I should see "Hours is not a number"
    And I should be on the Edit Task page for "Senior Photos"

Scenario: Non-numeric price (invalid)
    Given I am on the Edit Task page for "Senior Photos"
    And I fill in "Price" with "abc"
    And I press "Update"
    Then I should see "Price is not a number"
    And I should be on the Edit Task page for "Senior Photos"

