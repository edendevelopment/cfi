Then /^I should see (?:the|these) households?$/ do |table|
  households = all('#households .household').map do |household|
    table.headers.inject({}) do |result, key| 
      result[key] = household.find(:xpath, %{//*[@class="#{key.downcase}"]}).try(:text)
      result
    end
  end
  table.diff!(households) 
end

Given /^a household called "([^\"]*)"$/ do |caretaker|
  Factory.create :household, :caretaker => caretaker
end

Given /^a note "([^\"]*)" for household "([^\"]*)" and user "([^\"]*)"$/ do |note, caretaker, email|
  household = Household.find_by_caretaker caretaker
  user = User.find_by_email(email)
  Factory.create :comment, :comment => note, :commentable_id => household.id, :commentable_type => 'Household', :user => user, :created_at => Time.new, :updated_at => Time.new
end

When /^I add "([^\"]*)" to the household$/ do |person_name|
  select person_name, :from => "person_id"
  click_link_or_button "Add"
end

Then /^"([^\"]*)" should be living in the household "([^\"]*)"$/ do |person_name, household_name|
  within("#people") do
    page.should have_content(person_name)
  end
end

Then /^"([^\"]*)" should not be living in the household "([^\"]*)"$/ do |person_name, household_name|
    page.should have_no_css("#people a:contains('#{person_name}')")
end

When /^I remove "([^\"]*)" from the household$/ do |person_name|
  within("#person_#{Person.find_by_name(person_name).id}") do
    click_button "Remove"
  end
end

Then /^"([^\"]*)" should be a note for household "([^\"]*)"$/ do |note, household_name|
  page.should have_content(household_name)
  within ("#notes .comment_text") do
    page.should have_content(note)
  end
end

When /^I add the note "([^\"]*)" with photo "([^\"]*)" to the household$/ do |note, file_name|
  attach_file "comment_image", Rails.root.join('test', 'fixtures', file_name)
  fill_in "Note", :with => note
  click_button "Add note"
end

Then /^I should see the note "([^\"]*)" with photo "([^\"]*)"$/ do |note, file_name|
  within(".box") do
    page.should have_css(".photo")
    page.should have_css(".comment_text", :text => note)
  end
end

When /^I add the picture "([^\"]*)" to the household$/ do |file_name|
  attach_file "household_image", Rails.root.join('test', 'fixtures', file_name)
end

Then /^I should see a picture for the household$/ do
  page.should have_xpath("//dd[@id='household_image']")
end

Then /^I should not see a picture for the household$/ do
  page.should_not have_xpath("//dd[@id='household_image']")
end

Given /^a picture(?: "([^"]*)")? for household "([^"]*)"$/ do |file_name, household_name|
  When "I go to the page for household \"#{household_name}\""
  And "I follow \"Edit\""
  And "I add the picture \"#{file_name.nil? ? "sample.jpg" : file_name}\" to the household"
  And "I press \"Update\""
  Then "I should be on the page for household \"#{household_name}\""
  And "I should see a picture for the household"
end

When /^I upload a picture for household "([^"]*)"$/ do |household_name|
  Given "a picture for household \"#{household_name}\""
end

When /^I remove the picture for household "([^"]*)"/ do |household_name|
  When "I go to the page for household \"#{household_name}\""
  And "I press \"Remove picture\""
  Then "I should be on the page for household \"#{household_name}\""
end  
