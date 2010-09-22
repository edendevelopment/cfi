Cfi::Application.routes.draw do |map|
  map.devise_for 'users'

  map.resources :users

  map.resources :courses do |course|
    course.resources :students, :controller => 'courses/students'
  end

  map.resources :people, :member => {:make_student => :post, :basic_information => :get, :address => :get, :siblings => :get, :photo => :get, :public_education_info => :get, :obligations => :get, :social_development_info => :get, :add_sibling => :post, :remove_sibling => :delete, :add_caretaker => :post, :caretakers => :get, :remove_caretaker => :delete} do |person|
    person.resources :photos
    person.resources :comments
  end
  map.resources :students, :only => [:index]
  map.resources :villages

  map.admin '/admin', :controller => :admin, :action => :index

  map.root :controller => :courses
end
