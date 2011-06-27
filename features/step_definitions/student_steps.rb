Given /^a student called "([^\"]*)"$/ do |name|
  person = Factory.create :person, :name => name
  person.make_student!
end

Transform /^village "([^\"]*)"$/ do |village_name|
  Village.find_by_name(village_name)
end

When /^I make "([^\"]*)" a student$/ do |user_name|
  click_button "Make #{user_name} a student"
end

Then /^"([^\"]*)" should be a student$/ do |student_name|
  within(".student-status") do
    page.should have_content("student")
  end
end
