Then /^"([^\"]*)" should have (\d+) caretakers$/ do |person_name, num_of_caretakers|
  Person.find_by_name(person_name).caretakers.size.should == num_of_caretakers.to_i
end