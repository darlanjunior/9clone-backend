Rails.application.routes.draw do
  resources :todos
  get '/memes' => 'memes#index'
end
