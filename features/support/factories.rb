require 'factory_girl'

Factory.define :student do |student|
  
end

Factory.define :course do |course|
  
end

Factory.define :user do |user|
  user.sequence(:login) { |n| "user_#{n}" }
  user.password "pass"
end