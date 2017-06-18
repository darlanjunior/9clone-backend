Rails.application.routes.draw do
  resources :todos
  resources :memes, only: [:index, :create]
end
