Then /^"([^\"]*)" should have (\d+) caretakers$/ do |person_name, num_of_caretakers|
  Person.find_by_name(person_name).caretakers.size.should == num_of_caretakers.to_i
end

Then /^I should see caretaker "([^\"]*)"$/ do |caretaker_name|
  within('ul') do
    page.should have_css('li', caretaker_name)
  end
end

Given /^"([^\"]*)" has the caretaker "([^\"]*)" with a relationship "([^\"]*)"$/ do |person_name, caretaker_name, relationship_type|
  person = Person.find_by_name(person_name)
  caretaker = Person.find_by_name(caretaker_name)
  Relationship.create(:from_id => person.id, :to_id => caretaker.id, :relationship_type => 'aunty', :caretaker => true)
end

When /^I remove the caretaker "([^\"]*)"$/ do |name|
  person = Person.find_by_name(name)
  within("#person_#{person.id}") do
    click_button "Remove"
  end
end

Then /^I should not see caretaker "([^\"]*)"$/ do |caretaker_name|
   within('.people ul') do
    page.should_not have_css('li', caretaker_name)
  end
end

