Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  # users and posts routes
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show]
  end

  # login route
  get "/login", to: "sessions#new"
end
