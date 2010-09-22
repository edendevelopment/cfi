Cfi::Application.routes.draw do
  devise_for :users

  resources :users

  resources :courses do
    resources :students, :controller => 'courses/students'
  end

  resources :people, :member => {:make_student => :post, :basic_information => :get, :address => :get, :siblings => :get, :photo => :get, :public_education_info => :get, :obligations => :get, :social_development_info => :get, :add_sibling => :post, :remove_sibling => :delete, :add_caretaker => :post, :caretakers => :get, :remove_caretaker => :delete} do
    resources :photos
    resources :comments
  end
  resources :students, :only => [:index]
  resources :villages

  match '/admin' => 'admin#index'

  root :to => 'courses#index'
end
