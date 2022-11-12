Feature: display tasks sorted by different conditions

  As a Columbia University student
  So that I can quickly browse tasks based on my preferences
  I want to see tasks sorted by newest date, oldest date, lowest price, or highest price

Background: tasks have been added to database
  Given I am a valid user
  And I am signed in
  And there are tasks posted by other users
  
  Given the following tasks exist:

  | name                     | hours  | deadline                  | location                 | price | description                                                                        | user_id | completed |
  | Senior Photos            |   2    |  DateTime.new(2022,12,5)  | Low Library Steps        | 30    | Seeking experienced photographer for Senior pics!                                  | 1       | false     |
  | Building furniture       |   3    |  DateTime.new(2022,12,20) | McBain Hall              | 20    | Do you know how to build a dresser? Help me out!                                   | 1       | false     |
  | Pick up packages         |   0.5  |  DateTime.new(2022,12,4)  | Wein Hall                | 5     | I have been procrastinating this for two weeks please help                         | 2       | false     |
  | Take my survey for class |   0.25 |  DateTime.new(2022,11,30) | Online                   | 1     | Help me pass my psych class by taking this short quiz on your personality          | 1       | false     |
  | Buy me groceries         |   0.5  |  DateTime.new(2022,12,11) | Westside                 | 10    | I will reimburse you + give $10. I need 1 lb chicken breast and soy sauce. Thanks! | 2       | false     |
  | Need brownie pan         |   3    |  DateTime.new(2022,12,6)  | Carman Floor 5 Kitchen   | 3     | I am making brownies for my friends and need a pan!                                | 2       | false     |

  And I am on the All Tasks page
  Then 9 seed tasks should exist

Scenario: sort tasks by most recent date
  When I follow "Sort By Newest"
  Then I should see "Buy me groceries" before "Take my survey for class" 
  And I should see "Take my survey for class" before "Pick up packages" 
  And I should see "Pick up packages" before "Building furniture"
  And I should see "Building furniture" before "Need brownie pan"
  And I should see "Need brownie pan" before "Senior Photos"
  And I should see "Senior Photos" before "Need help with club fair"
  And I should see "Need help with club fair" before "Wall painting"
  And I should see "Wall painting" before "Need brownie pan"

Scenario: sort tasks by the oldest date
  When I follow "Sort By Oldest"
  Then I should see "Need brownie pan" before "Wall painting" 
  And I should see "Wall painting" before "Need help with club fair"
  And I should see "Need help with club fair" before "Senior Photos"
  And I should see "Senior Photos" before "Need brownie pan"
  And I should see "Need brownie pan" before "Building furniture"
  And I should see "Building furniture" before "Pick up packages"
  And I should see "Pick up packages" before "Take my survey for class"
  And I should see "Take my survey for class" before "Buy me groceries"

Scenario: sort tasks by increasing price
  When I follow "Sort Low to High"
  Then I should see "Take my survey for class" before "Need brownie pan"
  And I should see "Need brownie pan" before "Pick up packages"
  And I should see "Pick up packages" before "Buy me groceries"
  And I should see "Buy me groceries" before "Building furniture"
  And I should see "Building furniture" before "Senior Photos"

Scenario: sort tasks by decreasing price
  When I follow "Sort High to Low"
  Then I should see "Senior Photos" before "Building furniture"
  And I should see "Building furniture" before "Buy me groceries"
  And I should see "Buy me groceries" before "Pick up packages"
  And I should see "Pick up packages" before "Need brownie pan"
  And I should see "Need brownie pan" before "Take my survey for class"
  
  
 
 