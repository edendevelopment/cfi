ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  
  map.resources :users

  map.resources :courses do |course|
    course.resources :students, :controller => 'courses/students'
  end
  map.resources :students do |student|
    student.resources :photos
  end
  map.resources :villages
  
  map.root :controller => :courses
end
