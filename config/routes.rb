Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions'
  }
  resources :categories do
    resources :doctors
  end
  root "home#index"
  resources :users, only: [:show]
  resources :doctors, only: [:show]
  resources :appointmets, only: [:create, :edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
