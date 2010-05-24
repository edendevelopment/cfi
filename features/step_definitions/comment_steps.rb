When /^I add the comment "([^\"]*)"$/ do |text|
  fill_in "comment", :with => text
  click_button "Add comment"
end

Then /^the person "([^\"]*)" should have the comments "([^\"]*)"$/ do |person_name, comment_text|
  visit person_path(Person.find_by_name(person_name))
  within("#comments") do
    page.should have_content(comment_text)
  end
end
