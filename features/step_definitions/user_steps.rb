Given 'I am not authenticated' do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  User.new(:name => email.split('@').first,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I have one\s+social worker "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  User.new(:name => email.split('@').first,
           :email => email,
           :password => password,
           :password_confirmation => password,
           :social_worker => true).save!
end

Given /^a logged in user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Given %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given 'I am a new, authenticated user' do
  email = 'test@example.com'
  password = 'password'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{a logged in user "#{email}" with password "#{password}"}
end

Given /I am a new, authenticated social worker(?:| with email "([^\"]*)" and password "([^\"]*)")$/ do |email, password|
  email = 'test@example.com' if !email
  password = 'password' if !password

  Given %{I have one social worker "#{email}" with password "#{password}"}
  And %{a logged in user "#{email}" with password "#{password}"}
end

