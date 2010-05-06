Then /^I fill in the following fields with$/ do |table|
  table.rows_hash.each do |label, value|
    fill_in label, :with => value
  end
end

Then /^I should see (?:the|these) courses?$/ do |table|
  courses = all('#courses .course').map do |course|
    table.headers.inject({}) do |result, key| 
      result[key] = course.find(:xpath, %{//*[@class="#{key.downcase}"]}).try(:text)
      result
    end
  end
  table.diff!(courses) 
end

Given /^a course called "([^\"]*)"$/ do |name|
  Factory.create :course, :name => name
end

When /^I add "([^\"]*)" to the course$/ do |student_name|
  select student_name, :from => "student_id"
  click "Add"
end

Then /^"([^\"]*)" should be taking the course "([^\"]*)"$/ do |student_name, course_name|
  within("#students") do
    page.should have_content(student_name)
  end
end

Then /^"([^\"]*)" should not be taking the course "([^\"]*)"$/ do |student_name, course_name|
  within("#students") do
    page.should have_no_content(student_name)
  end
end

When /^I remove "([^\"]*)" from the course$/ do |student_name|
  within("#student_#{Student.find_by_name(student_name).id}") do
    click_button "Remove"
  end
end
