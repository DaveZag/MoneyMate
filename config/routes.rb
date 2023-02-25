Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_user
    end
    unauthenticated do
      root 'home#index', as: :unauthenticated_user
    end
  end

  resources :payments, only: [:new, :create] 
  resources :groups, only: [:index, :show, :new, :create]
end
