When /^I add the comment "([^\"]*)"$/ do |text|
  fill_in "comment", :with => text
  click_button "Add comment"
end

Then /^the student "([^\"]*)" should have the comments "([^\"]*)"$/ do |student_name, comment_text|
  visit student_path(Student.find_by_name(student_name))
  within("#comments") do
    page.should have_content(comment_text)
  end
end
