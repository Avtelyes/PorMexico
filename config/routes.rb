Rails.application.routes.draw do
  resources :locations

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  match 'posts/:id/hide', to: 'posts#hide', via: [:post]

  resources :posts
  resources :sessions, only: [:create, :destroy]
  resource :main, only: [:show]

end
