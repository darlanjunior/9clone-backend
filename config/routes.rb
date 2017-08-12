Rails.application.routes.draw do
  # resources :posters, only: [:index, :create, :update, :destroy]
  mount_devise_token_auth_for 'User', at: 'users', skip: [:confirmations, :registrations]
  mount_devise_token_auth_for 'Poster', at: 'users', skip: [:sessions, :passwords]
  resources :memes, only: [:index, :create]
end
