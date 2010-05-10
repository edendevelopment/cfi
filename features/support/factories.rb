require 'factory_girl'

Factory.define :student do |student|
  student.sequence(:name) {|n| "Student #{n}"}
  student.association :village
end

Factory.define :course do |course|
  
end

Factory.define :user do |user|
  user.sequence(:login) { |n| "user_#{n}" }
  user.password "pass"
end

Factory.define :village do |village|
  village.sequence(:name) { |n| "Village #{n}" }
end