Then /^I add the following siblings$/ do |table|
  # table is a Cucumber::Ast::Table
  siblings = table.raw.flatten.join("\n")
  And %Q{I fill in "Siblings" with "#{siblings}"}
end

Then /^I should see the student$/ do |table|
  output = []
  table.raw.each do |key, value|
    output << [key, find("#student .#{key.parameterize}").try(:text)]
  end
  table.diff!(output)
end

Then /^I should see the following siblings$/ do |table|
  # table is a Cucumber::Ast::Table
  page.has_css?('#student .siblings').should == true
  within('#student .siblings .sibling') do
    table.raw.each { |row| page.should have_content(row[0]) }
  end
end

Then /^I should see the student "([^\"]*)"$/ do |name|
  within('#students .student .name') do
    page.should have_content(name)
  end
end

def find_css_text(selector)
  find(selector).try(:text)
end

def find_student_details_in_student_list(keys)
  actual = []
  actual << keys.inject({}) do |student_details, key|
    student_details[key] = find_css_text("#students .student .#{key.parameterize}")
    student_details
  end
end

Given /^a student called "([^\"]*)"$/ do |name|
  Factory.create :student, :name => name
end

When /^I update the student with the following details$/ do |table|
  click_link('Edit')
  fill_in_fields(table)
  click_button('Update')
end
