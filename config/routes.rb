Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index", as: :unauthenticated_user

  authenticated do
    root to: "groups#index", as: :authenticated_user
  end

  resources :payments, only: [:new, :create] 
  resources :groups, only: [:index, :show, :new, :create]
end
