When /^I add the photo "([^\"]*)" with comment "([^\"]*)"$/ do |file_name, comment|
  attach_file "photo_image", Rails.root.join('test', 'fixtures', file_name)
  fill_in "photo_comment", :with => comment
  click_button "Add"
end

Then /^I should see the photo "([^\"]*)" with comment "([^\"]*)"$/ do |file_name, comment|
  within(".photo") do
    page.should have_css("img")
    page.should have_css(".comment", :text => comment)
  end
end

When /^I search people for "([^"]*)"$/ do |name|
  visit people_path
  fill_in 'search', :with => name
  click_button 'Search'
end
