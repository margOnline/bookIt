Feature: The user can edit resources that have been created

  @created_resource
  Scenario: Once a resource has been created, I can visit its edit page
  Given the user visits the home page
  And the users sees the name "Centre court" in the list of resources
  When the user clicks the "Edit" link for the resource
  Then the user will see an input field "New name"
  And the user will see a "Submit" button

  @created_resource
  Scenario: Once a resource has been created, I can edit it
  Given there is a resource with the name "Centre court" 
  When the user is on the resource's edit page
  And enters a new name and clicks the "Submit" button
  Then the user should see the new name "Suzanne Lenglan" on the home page
  And there should be a flash message saying the page has been successfully updated

  @created_resource
  Scenario: Once a resource has been created, if I leave the name field blank, the resource should not be updated, and I should see an error message.
  Given there is a resource with the name "Centre court" 
  When the user is on the resource's edit page
  And the user doesn't fill in the name field and clicks the "Submit" button.
  Then the user should see the error message "Name can't be blank"

  # @created_resource
  @multiple_resources
  Scenario: If I try to edit a resource with a name that is already taken.
  Given there is a resource with the name "Centre court" 
  When the user is on the the "Centre court" edit page
  And the user fills in the name field with "Suzanne Lenglan" and clicks the "Submit" button.
  Then the user should see the error message "Name has already been taken"
