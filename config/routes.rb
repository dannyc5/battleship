Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: [:index, :create, :destroy]
  resources :moves, only: [:create]
end
