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

When /^I add "([^\"]*)" to the household$/ do |person_name|
  select person_name, :from => "person_id"
  click "Add"
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
