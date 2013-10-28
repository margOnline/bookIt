Given(/^the user visits the home page$/) do
  visit root_path
end

Given(/^there are no resources in the database$/) do
  Resource.count == 0
end

When(/^I create a resource with the name "(.*?)"$/) do |name|
  fill_in 'Name', with: name
  click_button 'Add resource'
end

Then(/^the number of resources in the database will increase by (\d+)$/) do |number|
  expect(Resource.count).to == number
end