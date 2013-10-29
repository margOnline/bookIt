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




