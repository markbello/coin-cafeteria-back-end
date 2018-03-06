Rails.application.routes.draw do
  resources :coins
  resources :articles, only: [:show]
  # resources :users
  # resources :user_coins
  post "/login", to: 'auth#login'
end
