When /^I add a village called "([^\"]*)"$/ do |village_name|
  fill_in "village_name", :with => village_name
  click_button "Add village"
end

Then /^I should see "([^\"]*)" in the list of villages$/ do |village_name|
  within("#villages li") do
    page.should have_content(village_name)
  end
end

Given /^a village called "([^\"]*)"$/ do |name|
  Factory.create :village, :name => name
end

When /^I edit the village "([^\"]*)" to have name "([^\"]*)"$/ do |old_name, new_name|
  click_link "Edit"
  fill_in "village_name", :with => new_name
  click_button "Save"
end
