Then /^"([^\"]*)" should have (\d+) caretakers$/ do |person_name, num_of_caretakers|
  Person.find_by_name(person_name).caretakers.size.should == num_of_caretakers.to_i
end

Then /^I should see caretaker "([^\"]*)"$/ do |caretaker_name|
  within('ul') do
    page.should have_css('li', :text => caretaker_name)
  end
end

Given /^"([^\"]*)" has the caretaker "([^\"]*)"$/ do |person_name, caretaker_name|
  Person.find_by_name(person_name).add_caretaker(Person.find_by_name(caretaker_name))
end

When /^I remove the caretaker "([^\"]*)"$/ do |name|
  person = Person.find_by_name(name)
  within("#person_#{person.id}") do
    click_button "Remove"
  end
end

Then /^I should not see caretaker "([^\"]*)"$/ do |caretaker_name|
   within('.people ul') do
    page.should_not have_css('li', :text => caretaker_name)
  end
end

