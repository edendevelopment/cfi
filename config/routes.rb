Cfi::Application.routes.draw do
  resources :households

  devise_for :users

  resources :users

  resources :courses do
    resources :students, :controller => 'courses/students'
  end

  resources :households do
    resources :people, :controller => 'households/people'
    resources :comments, :controller => 'households/comments'

    member do
      delete :destroy_image
    end
  end

  resources :people do
    member do
      post   :make_student
      get    :basic_information
      get    :address
      get    :siblings
      get    :photo
      get    :public_education_info
      get    :obligations
      get    :social_development_info
      get    :pupil
      post   :add_sibling
      delete :remove_sibling
      post   :add_caretaker
      get    :caretakers
      delete :remove_caretaker
    end
    
    resources :photos
    resources :comments
  end
  resources :students, :only => [:index]
  resources :villages

  match '/admin' => 'admin#index'

  root :to => 'courses#index'
end
