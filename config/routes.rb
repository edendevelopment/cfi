ActionController::Routing::Routes.draw do |map|
  map.resources :courses do |course|
    course.resources :students, :controller => 'courses/students'
  end
  map.resources :students
  
  map.root :controller => :courses
end
