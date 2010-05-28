Then /^"([^\"]*)" should have (\d+) caretakers$/ do |person_name, num_of_caretakers|
  Person.find_by_name(person_name).caretakers.size.should == num_of_caretakers.to_i
end

Then /^I should see caretaker "([^\"]*)"$/ do |caretaker_name|
  within('ul.people') do
    page.should have_css('li', caretaker_name)
  end
end
