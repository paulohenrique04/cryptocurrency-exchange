Rails.application.routes.draw do
  get 'home/index'
  get 'wallets/show'
  get 'buys/index'
  get 'buys/create'
  devise_for :users
  resources :cryptocurrencies, :buys
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
