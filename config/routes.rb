Rails.application.routes.draw do
  mount_devise_token_auth_for 'Poster', at: 'posters', skip: [:sessions, :confirmations, :token_validations, :passwords]
  mount_devise_token_auth_for 'User', at: 'users'
  resources :memes, only: [:index, :create]
end
