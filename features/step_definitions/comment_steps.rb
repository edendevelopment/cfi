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

When /^a comment on "([^\"]*)" profile$/ do |person_name|
  person = Person.find_by_name(person_name)
  person.comments.create!(:comment => 'This is a comment', :user_id => User.first.id)
end

Then /^I should see (\d+) comments?$/ do |num_of_comments|
  within('#comments') do
    page.should have_css('.comment_text', :count => num_of_comments.to_i)
  end
end

When /^I edit the comment with "([^\"]*)"$/ do |text|
  within('#comments ul li') do
    click 'Edit'
  end
  fill_in "comment_comment", :with => text
  click_button "Update"
end
