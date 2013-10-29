Feature: The user can create a resource
  
  Scenario: When nothing else has been created yet
  Given the user visits the new resource page
  And there are no resources in the database
  When I create a resource with the name "Centre court"
  Then the number of resources in the database will increase by 1

  @created_resource
  Scenario: Once a resource has been created, I can see the name of the resource
  Given the user visits the home page
  Then the user will see the name "Centre court" of the resource that he just created

  @created_resource
  Scenario: Once a resource has been created, I can delete it
  Given the user visits the home page
  And the user sees the name "Centre court" in the list of resources 
  When the user clicks the "Delete" link for the resource
  Then the user wont see the name "Centre court"

  @created_resource
  Scenario: Once a resource has been created, I can edit its name
  Given the user visits the home page
  And the users sees the name "Centre court" in the list of resources
  When the user clicks the "Edit" link for the resource
  Then the user will see an input field "New name"
  And the user will see a "Update resource" button
