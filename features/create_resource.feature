Feature: The user can create a resource
  
  Scenario: When nothing else has been created yet
  Given the user visits the home page
  And there are no resources in the database
  When I create a resource with the name "Centre court"
  Then the number of resources in the database will increase by 1