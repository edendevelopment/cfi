ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :courses do |course|
    course.resources :students, :controller => 'courses/students'
  end
  map.resources :students
  
  map.root :controller => :courses
end
