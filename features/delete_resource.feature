Feature: The user can delete a resource

  @created_resource
  Scenario: Once a resource has been created, I can delete it
  Given the user visits the home page
  And the user sees the name "Centre court" in the list of resources 
  When the user clicks the "Delete" link for the resource
  Then the user wont see the name "Centre court"