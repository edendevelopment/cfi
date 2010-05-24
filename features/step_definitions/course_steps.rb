Then /^I fill in the following fields with$/ do |table|
  fill_in_fields(table)
end

def fill_in_fields(table)
  table.hashes.each do |row|
    label = row["Field"]
    value = row["Value"]
    type = row["Type"]
    case type
      when "Text"
        fill_in label, :with => value
      when "Select"
        select value, :from => label
      else
        raise "Invalid type: #{type}"
    end
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
    page.should have_no_css("#students a:contains('#{student_name}')")
end

When /^I remove "([^\"]*)" from the course$/ do |student_name|
  within("#student_#{Student.find_by_person_id(Person.find_by_name(student_name).id).id}") do
    click_button "Remove"
  end
end
