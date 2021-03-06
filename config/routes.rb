Rails.application.routes.draw do
  resources :locations

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :posts
  post 'posts/:id/hide' => 'posts#hide', as: :delete_post
  get 'maps' => 'locations#maps'
  post 'posts/help' => 'posts#help', as: :help_post
  post 'posts/cancel_help' => 'posts#cancel_help', as: :cancel_help_post
  post 'posts/submit' => 'posts#submit', as: :request_post

  get 'privacy' => 'pages#privacy'
  get 'thanks' => 'pages#thanks'


  resources :sessions, only: [:create, :destroy]
  resource :main, only: [:show]
  get 'institutions' => 'institutions#index'

end
