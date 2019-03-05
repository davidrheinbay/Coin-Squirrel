Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :partners, only: [:index]
  resources :games, only: [:show]
end
