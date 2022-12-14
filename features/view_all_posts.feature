Feature: view someone else’s post

    As a Columbia student who wants to complete some task
    So that I can learn more information about a particular task
    I want to view someone else’s post

Background: user is logged in
  Given I am a valid user
  And I am signed in
  
Scenario: there are available tasks
    Given there are tasks posted by other users
    And I am on the All Tasks page
    Then I should see "Billy Bob"
    And I should see "bb1234@columbia.edu"
    And I should see "Need brownie pan"
    And I should see "I am making brownies for my friends and need a pan!"
    And I should see "3.0 hr(s)"
    And I should see "Carman Floor 5 Kitchen"
    And I should see "$3"

Scenario: there are no available tasks
    Given I am on the All Tasks page
    Then I should see "There are no tasks available at the moment."