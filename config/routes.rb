Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'devise/sessions#new'

  # users and posts routes
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :posts, only: [:show] do
          resources :comments, only: [:create]
        end
      end
    end
  end
end
