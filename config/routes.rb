Rails.application.routes.draw do
  devise_for :users

  authenticated do
    root to: 'transactions#index'
  end

  root :to => 'pages#home'

  resources :partners, only: [:index, :new, :create, :edit, :update]
  resources :games, only: [:index, :show]
  resources :favgames, only: [:update]

  get "/858d1fa2cc7e0388776f1759981a0d06.html", to: "pages#858d1fa2cc7e0388776f1759981a0d06.html"
  resources :transactions, only: [:index, :new, :create]

  get "/imprint", to: "pages#imprint"
  get "/data_protection", to: "pages#data_protection"
  get "/terms", to: "pages#terms"
  get "/about", to: "pages#about"

  # error routes
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]

end
