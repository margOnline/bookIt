#When nothing else has been created
Given(/^the user visits the new resource page$/) do
  visit new_resource_path
end

Given(/^there are no resources in the database$/) do
  Resource.count == 0
end

When(/^I create a resource with the name "(.*?)"$/) do |name|
  fill_in 'Name', with: name
  click_button 'Submit'
end

Then(/^the number of resources in the database will increase by (\d+)$/) do |number|
  expect(Resource.count).to eq number.to_i
end

# Once a resource has been created
Given(/^the user visits the home page$/) do
   visit root_path
end

Then(/^the user will see the name "(.*?)" of the resource that he just created$/) do |name|
  expect(page).to have_content name
end

# Deleting a resource
Given(/^the user sees the name "(.*?)" in the list of resources$/) do |name|
  expect(page).to have_content name
end

When(/^the user clicks the "(.*?)" link for the resource$/) do |link|
  click_link link
end

Then(/^the user wont see the name "(.*?)"$/) do |name|
  expect(page).to_not have_content name
end

# Editing a resource
Given(/^the users sees the name "(.*?)" in the list of resources$/) do |name|
  expect(page).to have_content name
end

Then(/^the user will see an input field "(.*?)"$/) do |arg1|
  expect(page).to have_css 'input'
end

Then(/^the user will see a "(.*?)" button$/) do |edit|
  expect(page).to have_button edit
end


# USER CAN EDIT RESOURCE
Given(/^there is a resource with the name "(.*?)"$/) do |name|
  visit root_path
  expect(page).to have_content name
end

When(/^the user is on the resource's edit page$/) do
  click_link "Edit"
end

When(/^enters a new name and clicks the "(.*?)" button$/) do |button|
  fill_in "Name", with: "Suzanne Lenglan"
  click_button button
end

Then(/^the user should see the new name "(.*?)" on the home page$/) do |name|
  expect(page).to have_content name
end

Then(/^there should be a flash message saying the page has been successfully updated$/) do
  expect(page).to have_content 'Your resource was updated succesfully'
end

# USER CAN'T EDIT RESOURCE IF YOU LEAVE NAME FIELD BLANK
When(/^the user doesn't fill in the name field and clicks the "(.*?)" button\.$/) do |button|
  fill_in "Name", with:''
  click_button button
end

Then(/^the user should see the error message "(.*?)"$/) do |message|
  expect(page).to have_content message
end