Given /^a person called "([^\"]*)"$/ do |name|
  person = Factory.create :person, :name => name
end

When /^I add the person "([^\"]*)"$/ do |name|
  fill_in "person_name", :with => name
  click_button "Add person"
end

Then /^I add the following siblings$/ do |table|
  # table is a Cucumber::Ast::Table
  siblings = table.raw.flatten.join("\n")
  And %Q{I fill in "Siblings" with "#{siblings}"}
end

Then /^I should see the person "([^\"]*)" with$/ do |name, table|
  page.should have_css(".name:contains('#{name}')")
  output = []
  table.raw.each do |key, value|
    output << [key, find("#person .#{key.parameterize}").try(:text)]
  end
  table.diff!(output)
end

Then /^I should see the following siblings$/ do |table|
  # table is a Cucumber::Ast::Table
  page.has_css?('#person .siblings').should == true
  within('#person .siblings .sibling') do
    table.raw.each { |row| page.should have_content(row[0]) }
  end
end

Then /^I should see the person "([^\"]*)"$/ do |name|
  within('.people .person') do
    page.should have_content(name)
    page.should have_css('img')
  end
end

When /^I update the person with the following details$/ do |table|
  click_link('Edit')
  fill_in_fields(table)
  click_button('Update')
end

Given /^a person called "([^\"]*)" in (village "[^\"]*")$/ do |student_name, village|
  person = Factory.create :person, :name => student_name, :village => village
end
