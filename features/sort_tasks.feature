Feature: display tasks sorted by different conditions

  As a Columbia University student
  So that I can quickly browse tasks based on my preferences
  I want to see tasks sorted by newest date, oldest date, lowest price, or highest price

Background: tasks have been added to database
  Given I am a valid user
  And I am signed in

  Given the following tasks exist:

  | name                    | hours  | deadline                  | location                 | price | description                                                                        | user_id | completed |
  | Senior Photos           |   2    |  DateTime.new(2022,12,5)  | Low Library Steps        | 30    | Seeking experienced photographer for Senior pics!                                  | 1       | false     |
  | Building furniture      |   3    |  DateTime.new(2022,12,20) | McBain Hall              | 20    | Do you know how to build a dresser? Help me out!                                   | 1       | false     |
  | Take my survey for class|   0.25 |  DateTime.new(2022,11,30) | Online                   | 1     | Help me pass my psych class by taking this short quiz on your personality          | 1       | false     |


  And I am on the All Tasks page
  Then 3 seed tasks should exist

Scenario: sort tasks by most recent date
  When I follow "Sort By Newest"
  Then I should see "Building furniture" before "Senior Photos" 

Scenario: sort tasks by the oldest date
  When I follow "Sort By Oldest"
  

Scenario: sort tasks by increasing price
  When I follow "Sort Price Low to High price"

Scenario: sort tasks by decreasing price
  When I follow "Sort Price High to Low price"
  
  
 
 