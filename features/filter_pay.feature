Feature: filter by pay
    As a Columbia student who wants to see tasks at varying pay levels
    So that I can choose the best option for me
    I want to filter based on pay

Background: user is logged in
  Given I am a valid user
  And I am signed in
  And there are tasks posted by other users
  
Scenario: I want to see tasks with a pay of less than $20
    Given I am on the All Tasks page
    And I follow "Less than $20"
    Then I should see "Need brownie pan"
    And I should not see "Wall painting"
    And I should not see "Need help with club fair"

Scenario: I want to see tasks with pay between $20-$50
    Given I am on the All Tasks page
    And I follow "$20-$50"
    Then I should see "Wall painting"
    And I should not see "Need brownie pan"
    And I should not see "Need help with club fair"

Scenario: I want to see tasks with pay above $50
    Given I am on the All Tasks page
    And I follow "More than $50"
    Then I should see "Need help with club fair"
    And I should not see "Need brownie pan"
    And I should not see "Wall painting"