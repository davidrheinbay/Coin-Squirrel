Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :partners, only: [:index]
  resources :games, only: [:show]

  get "/858d1fa2cc7e0388776f1759981a0d06.html", to: "pages#858d1fa2cc7e0388776f1759981a0d06.html"
end
