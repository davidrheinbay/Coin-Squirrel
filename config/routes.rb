Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :partners, only: [:index, :new, :create, :edit, :update]
  resources :games, only: [:index, :show]
  get "/858d1fa2cc7e0388776f1759981a0d06.html", to: "pages#858d1fa2cc7e0388776f1759981a0d06.html"
  resources :transactions, only: [:index]
end
