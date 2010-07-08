Given /^a person called "([^\"]*)"$/ do |name|
  person = Factory.create :person, :name => name
end

When /^I add the person "([^\"]*)"$/ do |name|
  fill_in "person_name", :with => name
  click_button "Add person"
end

When /^I add the sibling "([^\"]*)"$/ do |name|
  select name, :from => 'Sibling'
  click_button "Add sibling"
end

Then /^I should see the person "([^\"]*)" with$/ do |name, table|
  page.should have_css(".name:contains('#{name}')")
  output = []
  table.raw.each do |key, value|
    output << [key, find("#person .#{key.parameterize}").try(:text)]
  end
  table.diff!(output)
end

Then /^I should see the sibling "([^\"]*)"$/ do |name|
  person = Person.find_by_name(name)
  page.should have_css("#person_#{person.id}")
end

Then /^I should not see the sibling "([^\"]*)"$/ do |name|
  person = Person.find_by_name(name)
  page.should have_no_css("#person_#{person.id}")
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
  person = Factory.create :person, :name => student_name, :address => Factory.build(:address, :village => village)
end

Given /^"([^\"]*)" is a sibling of "([^\"]*)"$/ do |p1, p2|
  Person.find_by_name(p1).add_sibling(Person.find_by_name(p2))
end

When /^I remove the sibling "([^\"]*)"$/ do |name|
  person = Person.find_by_name(name)
  within("#person_#{person.id}") do
    click_button "Remove"
  end
end

