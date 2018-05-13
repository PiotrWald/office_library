Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'books/:id', to: 'orders#create'

  resources :sessions, only: [:create, :destroy]
  resources :books
  resources :orders, only: [:edit]

  root 'books#index'
end
