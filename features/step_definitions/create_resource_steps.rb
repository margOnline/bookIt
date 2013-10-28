#When nothing else has been created
Given(/^the user visits the new resource page$/) do
  visit new_resource_path
end

Given(/^there are no resources in the database$/) do
  Resource.count == 0
end

When(/^I create a resource with the name "(.*?)"$/) do |name|
  fill_in 'Name', with: name
  click_button 'Add resource'
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