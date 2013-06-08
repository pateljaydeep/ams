Given(/^I have asset types (.+)$/) do |assets|
  assets.split(', ').each do |asset|
    AssetType.create!(:name => asset)
  end
end

Given /^a logged in user$/ do
  visit('/login')
  fill_in('name', :with => '')
  fill_in('password', :with => '')
  click_button('Sign in')
end

Given /^I am on homepage$/ do
  visit('/home')
end

Then /^I should see "(.*)"$/ do |text|
  page.should have_content text
end
