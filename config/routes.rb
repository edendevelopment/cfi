ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :users

  map.resources :courses do |course|
    course.resources :students, :controller => 'courses/students'
  end
  map.resources :people, :member => {:add_comment => :post, :make_student => :post, :basic_information => :get, :address => :get, :siblings => :get} do |person|
    person.resources :photos
  end
  map.resources :villages

  map.admin '/admin', :controller => :admin, :action => :index

  map.root :controller => :courses
end
