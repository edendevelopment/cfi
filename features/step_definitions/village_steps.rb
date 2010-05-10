When /^I add a village called "([^\"]*)"$/ do |village_name|
  fill_in "village_name", :with => village_name
  click_button "Add village"
end

Then /^I should see "([^\"]*)" in the list of villages$/ do |village_name|
  with_scope("#villages li") do
    page.should have_content(village_name)
  end
end
